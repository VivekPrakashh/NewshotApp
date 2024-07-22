import 'package:drift/drift.dart';
import 'package:news_shots_app/app/data/models/news/news_section.dart';

import '../../models/news/news.dart';
import '../convertors/category_convertor.dart';
import '../convertors/faq_list_convertor.dart';
import '../convertors/generic_convertor.dart';
import '../convertors/generic_list_convertor.dart';
import '../convertors/poll_convertor.dart';
import '../convertors/string_list_convertor.dart';

class CategoryNewsCache extends Table {
  TextColumn get newsId => text().unique()();
  TextColumn get categoryId => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text().map(CategoryConvertor()).nullable()();
  TextColumn get language => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get urlToImage => text().nullable()();
  TextColumn get priority => text().nullable()();
  DateTimeColumn get publishedOn => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get tags => text().map(StringListConvertor())();
  TextColumn get faq => text().map(FaqListConvertor())();
  TextColumn get poll => text().map(PollConvertor()).nullable()();
  TextColumn get doubts => text()
      .map(GenericListConvertor<NewsDoubts>(
        fromJson: (json) => NewsDoubts.fromJson(json),
        toJson: (doubt) => doubt.toJson(),
      ))
      .nullable()();
  TextColumn get sections => text()
      .map(GenericListConvertor<NewsSection>(
        fromJson: (json) => NewsSection.fromJson(json),
        toJson: (section) => section.toJson(),
      ))
      .nullable()();
  TextColumn get originalTitle => text().nullable()();
  TextColumn get formattedDescription => text().nullable()();
  TextColumn get source => text()
      .map(GenericConvertor<Source>(
        fromJson: (json) => Source.fromJson(json),
        toJson: (fact) => fact.toJson(),
      ))
      .nullable()();
  BoolColumn get pollApproved => boolean().nullable()();
  BoolColumn get quizApproved => boolean().nullable()();
  BoolColumn get faqApproved => boolean().nullable()();
  TextColumn get notificationTitle => text().nullable()();
}
