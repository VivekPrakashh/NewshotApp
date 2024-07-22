import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/data/services/social_embed_services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbedSocial extends StatefulWidget {
  final String tweetUrl;
  const EmbedSocial({super.key, required this.tweetUrl});

  @override
  State<EmbedSocial> createState() => _EmbedSocialState();
}

class _EmbedSocialState extends State<EmbedSocial> {
  late final WebViewController webViewController;
  final isLoading = false.obs;
  final hasResult = false.obs;

  final webviewHeight = 0.0.obs;

  @override
  void initState() {
    loadSocialPost();
    super.initState();
  }

  loadSocialPost() async {
    isLoading.value = true;
    final result = await SocialEmbedService.getTwitterEmbedHtml(
      widget.tweetUrl,
    );

    await result.fold((l) {
      hasResult.value = false;
    }, (r) async {
      hasResult.value = true;
      await _initWebviewController(r);
    });

    isLoading.value = false;
  }

  _initWebviewController(String blockContent) async {
    log(blockContent);
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'flutter_injector',
        onMessageReceived: (message) {
          webviewHeight.value = double.parse(message.message);
          log("Received Height: ${message.message}");
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
            if (request.isMainFrame) {
              final url = request.url;
              await launchUrlString(
                url,
                mode: LaunchMode.externalApplication,
              );

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageFinished: (url) {
            Future.delayed(1.seconds, () {
              _updateHeight();
              Future.delayed(3.seconds, () {
                _updateHeight();
              });
            });
          },
        ),
      );
    await webViewController.loadRequest(Uri.dataFromString(
      '''
        <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
        <body>
          $blockContent
        </body>
        </html>
        ''',
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ));
  }

  void _updateHeight() async {
    String script = """
      (function() {
        var height = 0;
        function updateHeight() {
          var twitterHeight = document.getElementsByClassName("twitter-tweet")[0].offsetHeight;

          var newHeight = document.documentElement.scrollHeight;
          if(twitterHeight!=null||twitterHeight!=undefined) {
            newHeight  = twitterHeight + 30;
          }

          if (height !== newHeight) {
            height = newHeight;
            flutter_injector.postMessage(height.toString());
          }
        }
        new ResizeObserver(updateHeight).observe(document.body);
        updateHeight();
      })();
    """;

    await webViewController.runJavaScript(script);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (!hasResult.value) {
        return const SizedBox.shrink();
      }

      return SizedBox(
        width: double.maxFinite,
        height: webviewHeight.value,
        child: WebViewWidget(controller: webViewController),
      );
    });
  }
}
