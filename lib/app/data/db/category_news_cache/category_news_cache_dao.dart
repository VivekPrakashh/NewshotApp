import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/core/failures.dart';
import 'package:news_shots_app/app/data/db/category_news_cache/category_news_cache.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/db/local_session/local_session.dart';
import 'package:news_shots_app/app/data/models/news/news_section.dart';

import '../../../core/util_functions.dart';
import '../../models/news/category.dart';
import '../../models/news/news.dart';
import '../../services/news_services.dart';
part 'category_news_cache_dao.g.dart';

@DriftAccessor(tables: [CategoryNewsCache, LocalSession])
class CategoryNewsCacheDao extends DatabaseAccessor<AppLocalDB>
    with _$CategoryNewsCacheDaoMixin {
  CategoryNewsCacheDao(super.attachedDatabase);

  Future<Either<InfraFailure, List<News>>> getNewsBycategoryId(
      Category category) async {
    final NewsServices newsServices = Get.find<NewsServices>();
    final lastFetchTime = await (selectOnly(localSession)
          ..addColumns([localSession.lastCategoryRequestTime]))
        .map((p0) => p0.read(localSession.lastCategoryRequestTime))
        .getSingle();

    if (lastFetchTime == null ||
        lastFetchTime.add(30.minutes).isBefore(DateTime.now())) {
      debugPrint("fetching latest news by category on expired");
      final result =
          await newsServices.fetchNewsByCategory(category: category, limit: 20);

      return result.fold((l) async {
        l.maybeMap(
          orElse: () {
            Get.snackbar("Could Not Fetch The Latest News, Some Issue.", "",
                duration: 6.seconds,
                icon: const Icon(Icons.error),
                backgroundColor: const Color.fromARGB(184, 255, 177, 171),
                snackPosition: SnackPosition.BOTTOM,
                messageText: const SizedBox());
          },
          noInternet: (value) {
            Get.snackbar(
              "Network Error",
              "Your Internet Is Not Working",
              duration: 6.seconds,
              icon: const Icon(Icons.error),
              backgroundColor: const Color.fromARGB(184, 255, 177, 171),
              snackPosition: SnackPosition.BOTTOM,
            );
          },
        );

        final cachedNews = await _getCachedNews(category.id);
        return right(cachedNews);
      }, (r) async {
        await transaction(() async {
          await delete(categoryNewsCache).go();
          await _insertManyNews(r);
          await _updatelastRequestTime();
          return null;
        });
        return right(r);
      });
    } else {
      final cachedNews = await _getCachedNews(category.id);

      if (cachedNews.length >= 60) {
        return right(cachedNews);
      }

      final newsFromServer = await newsServices
          .fetchNewsByCategory(
              category: category,
              limit: cachedNews.length + 20,
              cacheRequest: false)
          .then((value) => value.fold((l) => <News>[], (r) => r));

      await _insertManyNews(newsFromServer);
      final combinedNews =
          removeDuplicatesFromNews([...cachedNews, ...newsFromServer]);
      return right(combinedNews);
    }

    // select(categoryNewsCache)
    //   ..where((tbl) => tbl.categoryId.equals(categoryId))
    //   ..get();
  }

  Future<void> _insertManyNews(List<News> news) async {
    final newsToInsert = news.map(
      (e) => CategoryNewsCacheData(
        categoryId: e.category!.id,
        newsId: e.id!,
        title: e.title,
        description: e.description,
        tags: (e.tags)?.cast<String>() ?? [],
        faq: e.faq,
        category: e.category,
        createdAt: e.createdAt,
        language: e.language,
        publishedOn: e.publishedOn,
        updatedAt: e.updatedAt,
        url: e.url,
        urlToImage: e.urlToImage,
        poll: e.poll,
        formattedDescription: e.formattedDescription,
        source: e.source,
        originalTitle: e.originalTitle,
        pollApproved: e.pollApproved,
        quizApproved: e.quizApproved,
        faqApproved: e.faqApproved,
        notificationTitle: e.notificationTitle,
        doubts: e.doubts,
        sections: e.sections,
      ),
    );
    await batch(
      (batch) => batch.insertAll(
        categoryNewsCache,
        newsToInsert,
        mode: InsertMode.insertOrReplace,
      ),
    );
  }

  Future<List<News>> _getCachedNews(String categoryId) async {
    final cachedNews = (await (select(categoryNewsCache)
              ..where((tbl) => tbl.categoryId.equals(categoryId))
              ..where((tbl) => tbl.language.equals(
                  Get.locale?.getLanguageString().toLowerCase() ?? "english"))
              ..orderBy(
                [
                  (tbl) => OrderingTerm(
                      expression: tbl.publishedOn, mode: OrderingMode.desc)
                ],
              ))
            .get())
        .map(
          (e) => News(
            id: e.newsId,
            title: e.title,
            description: e.description,
            urlToImage: e.urlToImage,
            url: e.url,
            category: e.category,
            createdAt: e.createdAt,
            faq: e.faq,
            language: e.language,
            updatedAt: e.updatedAt,
            publishedOn: e.publishedOn,
            originalTitle: e.originalTitle,
            poll: e.poll,
            formattedDescription: e.formattedDescription,
            source: e.source,
            pollApproved: e.pollApproved ?? false,
            quizApproved: e.quizApproved ?? false,
            faqApproved: e.faqApproved ?? false,
            notificationTitle: e.notificationTitle,
            doubts: e.doubts ?? <NewsDoubts>[],
            sections: e.sections ?? <NewsSection>[],
          ),
        )
        .toList();
    return cachedNews;
  }

  _updatelastRequestTime() async {
    await update(localSession).write(
        LocalSessionCompanion(lastCategoryRequestTime: Value(DateTime.now())));
  }
}
