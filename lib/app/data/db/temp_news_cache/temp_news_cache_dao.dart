import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/data/core/failures.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/db/local_session/local_session.dart';
import 'package:news_shots_app/app/data/db/temp_news_cache/temp_news_cache.dart';
import 'package:news_shots_app/app/data/models/news/news_section.dart';
import 'package:news_shots_app/app/data/services/news_services.dart';

import '../../../core/util_functions.dart';
import '../../models/news/news.dart';
part 'temp_news_cache_dao.g.dart';

@DriftAccessor(tables: [TempNewsCaches, LocalSession])
class TempNewsCacheDao extends DatabaseAccessor<AppLocalDB>
    with _$TempNewsCacheDaoMixin {
  TempNewsCacheDao(super.attachedDatabase);

  Future<Either<InfraFailure, (bool, List<News>)>> getNews(
      {bool forceRefreshed = false}) async {
    try {
      final NewsServices newsServices = Get.find<NewsServices>();
      final lastFetchTime = await (selectOnly(localSession)
            ..addColumns([localSession.lastRequestTime]))
          .map((p0) => p0.read(localSession.lastRequestTime))
          .getSingle();

      if (lastFetchTime == null ||
          lastFetchTime.add(15.minutes).isBefore(DateTime.now())) {
        debugPrint("fetching latest news on expired");
        final result = await newsServices.fetchNews(cacheRequest: false);

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

          final cachedNews = await _getNewsFromDb();
          return right((false, cachedNews));
        }, (r) async {
          try {
            await transaction(() async {
              await delete(tempNewsCaches).go();
              await Future.delayed(50.milliseconds);
              await _resetManualCounter();
              await Future.delayed(50.milliseconds);

              await _insertManyNews(r);
              await Future.delayed(50.milliseconds);

              await _updatelastRequestTime();
              return null;
            });
          } on Exception catch (e, s) {
            Get.find<Logger>()
                .e("Error in Set News in LocalDB", error: e, stackTrace: s);
          }
          return right((false, r));
        });
      } else {
        final cachedNews = await _getNewsFromDb();
        if (forceRefreshed) {
          final refreshCount = await _getManualRefressCount();
          await _incrementManualRefress();
          if (refreshCount <= 2) {
            debugPrint("fetching latest news on force refresh");
            final newsFromServer = await newsServices
                .fetchNews(
                    cacheRequest: false,
                    limit: ((20 * (refreshCount + 1)) + 20))
                .then((value) => value.fold((l) => <News>[], (r) => r));
            await _insertManyNews(newsFromServer);
            final combinedNews =
                removeDuplicatesFromNews([...cachedNews, ...newsFromServer]);

            return right((true, combinedNews));
          } else {
            debugPrint("returning cached news forced");

            return right((true, cachedNews));
          }
        } else {
          debugPrint("returning cached news");

          return right((true, cachedNews));
        }
      }
    } on Exception catch (e, s) {
      Get.find<Logger>().e("Error in Fetch news", error: e, stackTrace: s);
      return left(const InfraFailure.unexpected());
    }
  }

  Future<void> _insertManyNews(List<News> news) async {
    final newsToInsert = news.map(
      (e) => TempNewsCache(
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
        tempNewsCaches,
        newsToInsert,
        mode: InsertMode.insertOrReplace,
      ),
    );
  }

  Future<List<News>> _getNewsFromDb() async {
    return (await (select(tempNewsCaches)
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
  }

  Future<void> _updatelastRequestTime() async {
    await (update(localSession)
        .write(LocalSessionCompanion(lastRequestTime: Value(DateTime.now()))));
  }

  _incrementManualRefress() async {
    final count = await _getManualRefressCount();

    update(localSession)
        .write(LocalSessionCompanion(manualRefressCount: Value(count + 1)));
  }

  Future<void> _resetManualCounter() async {
    await (update(localSession)
        .write(const LocalSessionCompanion(manualRefressCount: Value(0))));
  }

  Future<int> _getManualRefressCount() async {
    return (await (selectOnly(localSession)
              ..addColumns([localSession.manualRefressCount]))
            .map((p0) => p0.read(localSession.manualRefressCount))
            .getSingle()) ??
        0;
  }

  Future<void> emptyNewsOnLanguageChange() async {
    final NewsServices newsServices = Get.find<NewsServices>();
    debugPrint("fetching latest news on langauge change");
    final result = await newsServices.fetchNews(cacheRequest: false);
    return result.fold((l) {
      // return left(l);
    }, (r) async {
      await delete(tempNewsCaches).go();
      await _resetManualCounter();
      await _insertManyNews(r);
      await _updatelastRequestTime();
      // return right(r);
      await db.unreadThreadDao.deleteThreadsOnLanguageChange();
    });
  }
}
