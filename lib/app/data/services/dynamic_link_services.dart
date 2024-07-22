import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class DynamicLinkServices {
  static Future<String> createNewsShareLink(String newsId) async {
    return await _generateDynamicLink(parameters: {
      "newsId": newsId,
    });
  }

  static Future<String> createThreadShareLink(String threadId) async {
    return await _generateDynamicLink(parameters: {
      "threadId": threadId,
    });
  }

  static Future<String> _generateDynamicLink(
      {required Map<String, dynamic> parameters}) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.https("revealinside.in", "/link", parameters),
      uriPrefix: "https://revealinside.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.revealInside"),
      iosParameters: const IOSParameters(
        bundleId: "com.revealInside",
        appStoreId: "6502818826",
      ),
    );
    final dynamicLink = await Get.find<FirebaseDynamicLinks>()
        .buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }
}
