import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
import 'package:news_shots_app/app/data/db/database.dart';
import 'package:news_shots_app/app/data/db/unread_news/unread_news.dart';
import 'package:news_shots_app/app/data/models/news/news_section.dart';

import '../../models/news/news.dart';
part 'unread_news_dao.g.dart';

@DriftAccessor(tables: [UnreadNews])
class UnreadNewsDao extends DatabaseAccessor<AppLocalDB>
    with _$UnreadNewsDaoMixin {
  UnreadNewsDao(super.attachedDatabase);

  Future<void> setNews({required List<News> news}) async {
    Get.find<Logger>().i("Set unread news ${news.length}");

    final newsToInsert = news.map(
      (e) => UnreadNew(
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
        xUrl: e.xUrl,
      ),
    );

    await delete(unreadNews).go();

    await batch(
      (batch) => batch.insertAll(
        unreadNews,
        newsToInsert,
        mode: InsertMode.insertOrReplace,
      ),
    );
  }

  Future<List<News>> getNews() async {
    return (await (select(unreadNews)
              ..where((tbl) => tbl.language.equals(
                  Get.locale?.getLanguageString().toLowerCase() ?? "english")))
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
            xUrl: e.xUrl,
          ),
        )
        .toList();
  }
}
