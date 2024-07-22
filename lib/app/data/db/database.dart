import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:news_shots_app/app/data/db/category_news_cache/category_news_cache.dart';
import 'package:news_shots_app/app/data/db/local_session/local_session.dart';
import 'package:news_shots_app/app/data/db/local_session/local_session_dao.dart';
import 'package:news_shots_app/app/data/db/news_bookmark/news_bookmark.dart';
import 'package:news_shots_app/app/data/db/news_logs/news_logs_dao.dart';
import 'package:news_shots_app/app/data/db/show_case_actions/show_case_actions.dart';
import 'package:news_shots_app/app/data/db/show_case_actions/show_case_actions_dao.dart';
import 'package:news_shots_app/app/data/db/temp_news_cache/temp_news_cache.dart';
import 'package:news_shots_app/app/data/db/temp_news_cache/temp_news_cache_dao.dart';
import 'package:news_shots_app/app/data/db/unread_news/unread_news.dart';
import 'package:news_shots_app/app/data/db/unread_news/unread_news_dao.dart';
import 'package:news_shots_app/app/data/db/unread_thread/unread_thread.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/extenstions.dart';
import '../../core/text_scale_factors.dart';
import '../models/address.dart';
import '../models/news/category.dart';
import '../models/news/news.dart';
import '../models/news/news_section.dart';
import '../models/threads/thread.dart';
import 'category_news_cache/category_news_cache_dao.dart';
import 'convertors/address_convertor.dart';
import 'convertors/category_convertor.dart';
import 'convertors/faq_list_convertor.dart';
import 'convertors/generic_convertor.dart';
import 'convertors/generic_list_convertor.dart';
import 'convertors/poll_convertor.dart';
import 'convertors/string_list_convertor.dart';
import 'convertors/text_scale_factor_convertor.dart';
import 'news_bookmark/news_bookmark_dao.dart';
import 'news_logs/news_logs.dart';
import 'schema_versions.dart';
import 'unread_thread/unread_thread_dao.dart';
part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'news.db.sqlite'));
    return NativeDatabase.createInBackground(
      file,
      logStatements: false,
      setup: (database) {
        database.execute('PRAGMA journal_mode=WAL;');
        print("db setup");
      },
    );
  });
}

@DriftDatabase(tables: [
  LocalSession,
  NewsLogs,
  UnreadNews,
  NewsBookmarks,
  UnreadThread,
  ShowCaseActions,
  TempNewsCaches,
  CategoryNewsCache,
], daos: [
  LocalSessionsDao,
  NewsLogsDao,
  UnreadNewsDao,
  NewsBookmarksDao,
  UnreadThreadDao,
  ShowCaseActionsDao,
  TempNewsCacheDao,
  CategoryNewsCacheDao,
])
class AppLocalDB extends _$AppLocalDB {
  AppLocalDB() : super(_openConnection());
  @override
  int get schemaVersion => 20;
  // run command on version change
  //dart run drift_dev schema dump lib/app/data/db/database.dart lib/app/data/db/drift_migrations/
  // dart run drift_dev schema steps lib/app/data/db/drift_migrations/ lib/app/data/db/schema_versions.dart

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // if (from < 2) {
        //   // we added the dueDate property in the change from version 1 to
        //   // version 2
        //   await m.addColumn(localSession, localSession.appVersion);
        // }
        // if (from < 3) {
        //   // created showcase action table
        //   // version 3
        //   await m.createTable(showCaseActions);
        // }
        // // if (from < 4) {
        // //   // Added original text column
        // //   // version 4
        // // await m.addColumn(unreadNews, unreadNews.originalText);
        // // }
        // if (from < 5) {
        //   // Added formattedDescription column
        //   // version 5
        //   await m.addColumn(unreadNews, unreadNews.formattedDescription);
        // }
        // if (from < 6) {
        //   // Added source column
        //   // version 6
        //   await m.addColumn(unreadNews, unreadNews.source);
        // }
        // if (from < 7) {
        //   // Added originaltitle
        //   // version 7
        //   await m.addColumn(unreadNews, unreadNews.originalTitle);
        // }
        // if (from < 8) {
        //   // Added originaltitle
        //   // version 7
        //   await m.addColumn(unreadNews, unreadNews.pollApproved);
        //   await m.addColumn(unreadNews, unreadNews.quizApproved);
        // }
        // if (from < 9) {
        //   // Added originaltitle
        //   // version 7

        //   await m.addColumn(unreadNews, unreadNews.faqApproved);
        // }
        // if (from < 10) {
        //   await m.addColumn(localSession, localSession.ratingReminder);
        //   await m.addColumn(localSession, localSession.lastAskedRating);
        // }
        // if (from < 11) {
        //   await m.addColumn(localSession, localSession.lastRequestTime);
        //   await m.addColumn(localSession, localSession.manualRefressCount);
        //   await m.createTable(tempNewsCaches);
        // }
        // if (from < 12) {
        //   await m.addColumn(localSession, localSession.notificationPreference);
        // }
        // if (from < 13) {
        //   await m.addColumn(localSession, localSession.notificationPermission);
        //   await m.addColumn(
        //       localSession, localSession.notificationPermissionAlertShownCount);
        // }
        // if (from < 14) {
        //   await m.addColumn(localSession, localSession.hideNewsOption);
        // }
        // if (from < 15) {
        //   await m.addColumn(localSession, localSession.lastCategoryRequestTime);
        //   await m.createTable(categoryNewsCache);
        // }
        // if (from < 16) {
        //   await m.addColumn(tempNewsCaches, tempNewsCaches.notificationTitle);
        //   await m.addColumn(unreadNews, unreadNews.notificationTitle);
        // }
        // if (from < 17) {
        //   await m.addColumn(categoryNewsCache, categoryNewsCache.doubts);
        //   await m.addColumn(tempNewsCaches, tempNewsCaches.doubts);
        //   await m.addColumn(unreadNews, unreadNews.doubts);
        // }
        // if (from < 18) {
        //   await m.addColumn(categoryNewsCache, categoryNewsCache.sections);
        //   await m.addColumn(tempNewsCaches, tempNewsCaches.sections);
        //   await m.addColumn(unreadNews, unreadNews.sections);
        // }
        await customStatement('PRAGMA foreign_keys = OFF');
        await m.runMigrationSteps(
          from: from,
          to: to,
          steps: migrationSteps(
            from1To2: (m, schema) async {
              await m.addColumn(
                  schema.localSession, schema.localSession.appVersion);
            },
            from2To3: (m, schema) async {
              await m.createTable(schema.showCaseActions);
            },
            from3To5: (m, schema) async {
              await m.addColumn(
                  schema.unreadNews, schema.unreadNews.formattedDescription);
            },
            from5To6: (m, schema) async {
              await m.addColumn(schema.unreadNews, schema.unreadNews.source);
            },
            from6To7: (m, schema) async {
              await m.addColumn(
                  schema.unreadNews, schema.unreadNews.originalTitle);
            },
            from7To8: (m, schema) async {
              await m.addColumn(
                  schema.unreadNews, schema.unreadNews.pollApproved);
              await m.addColumn(
                  schema.unreadNews, schema.unreadNews.quizApproved);
            },
            from8To9: (m, schema) async {
              await m.addColumn(
                  schema.unreadNews, schema.unreadNews.faqApproved);
            },
            from9To10: (m, schema) async {
              await m.addColumn(
                  schema.localSession, schema.localSession.ratingReminder);
              await m.addColumn(
                  schema.localSession, schema.localSession.lastAskedRating);
            },
            from10To11: (m, schema) async {
              await m.addColumn(
                  schema.localSession, schema.localSession.lastRequestTime);
              await m.addColumn(
                  schema.localSession, schema.localSession.manualRefressCount);
              await m.createTable(schema.tempNewsCaches);
            },
            from11To12: (m, schema) async {
              await m.addColumn(schema.localSession,
                  schema.localSession.notificationPreference);
            },
            from12To13: (m, schema) async {
              await m.addColumn(schema.localSession,
                  schema.localSession.notificationPermission);
              await m.addColumn(schema.localSession,
                  schema.localSession.notificationPermissionAlertShownCount);
            },
            from13To14: (m, schema) async {
              await m.addColumn(
                  schema.localSession, schema.localSession.hideNewsOption);
            },
            from14To15: (m, schema) async {
              await m.addColumn(schema.localSession,
                  schema.localSession.lastCategoryRequestTime);
              await m.createTable(schema.categoryNewsCache);
            },
            from15To16: (m, schema) async {
              await m.addColumn(schema.tempNewsCaches,
                  schema.tempNewsCaches.notificationTitle);
              await m.addColumn(
                  schema.unreadNews, schema.unreadNews.notificationTitle);
            },
            from16To17: (m, schema) async {
              await m.addColumn(
                  schema.categoryNewsCache, schema.categoryNewsCache.doubts);
              await m.addColumn(
                  schema.tempNewsCaches, schema.tempNewsCaches.doubts);
              await m.addColumn(schema.unreadNews, schema.unreadNews.doubts);
            },
            from17To18: (m, schema) async {
              await m.addColumn(
                  schema.categoryNewsCache, schema.categoryNewsCache.sections);
              await m.addColumn(
                  schema.tempNewsCaches, schema.tempNewsCaches.sections);
              await m.addColumn(schema.unreadNews, schema.unreadNews.sections);
            },
            from18To19: (m, schema) async {
              await m.addColumn(
                  schema.localSession, schema.localSession.hideDoubts);
            },
            from19To20: (m, schema) async {
              await m.addColumn(schema.unreadNews, schema.unreadNews.xUrl);
            },
          ),
        );
        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }
}
