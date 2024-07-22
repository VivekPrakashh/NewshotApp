import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_shots_app/app/data/core/failures.dart';

class SocialEmbedService {
  static Future<Either<InfraFailure, String>> getTwitterEmbedHtml(
      String tweetUrl) async {
    final embedUrl = 'https://publish.twitter.com/oembed?url=$tweetUrl';
    final dio = Dio();

    try {
      final response = await dio.get(embedUrl);

      if (response.statusCode == 200 && response.data['html'] != null) {
        return right(response.data['html'] as String);
      } else {
        return left(const InfraFailure.unexpected());
      }
    } catch (e) {
      return left(const InfraFailure.serverError());
    }
  }
}
