import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_shots_app/app/data/models/news/news.dart';
part 'news_with_loading.freezed.dart';

@freezed
class NewsWithLoading with _$NewsWithLoading {
  const factory NewsWithLoading({
    @Default(true) bool isLoading,
    @Default([]) List<News> news,
    @Default(20) int limit,
  }) = _NewsWithLoading;
}
