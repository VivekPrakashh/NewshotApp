import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_shots_app/app/modules/news_stories/ui_states/news_or_thread.dart';

import '../../../data/models/news/news.dart';
part 'news_details_arguments.freezed.dart';

@freezed
class NewsDetailsArguments with _$NewsDetailsArguments {
  const factory NewsDetailsArguments({
    required List<NewsOrThread> news,
    required int currentIndex,
    required Future<List<News>> Function(int count)? onLoad,
    @Default(false) bool redirectToMainNews,
  }) = _NewsDetailsArguments;
}
