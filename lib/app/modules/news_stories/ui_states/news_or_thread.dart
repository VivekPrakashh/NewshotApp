import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/news/news.dart';
import '../../../data/models/threads/thread.dart';
part 'news_or_thread.freezed.dart';

@freezed
class NewsOrThread with _$NewsOrThread {

  const factory NewsOrThread.news({required News news}) = _News;
  const factory NewsOrThread.thread({required Thread thread}) = ThreadType;
}

extension NewsOrThreadX on NewsOrThread {
  News? getNews() {
    return whenOrNull(
      news: (news) => news,
    );
  }

  Thread? getThread() {
    return whenOrNull(
      thread: (thread) => thread,
    );
  }

  bool get isNews => when(
        news: (_) => true,
        thread: (_) => false,
      );

  bool get isThread => when(
        news: (_) => false,
        thread: (_) => true,
      );

  String get id =>
      when(news: (news) => news.id!, thread: (thread) => thread.id);
}
