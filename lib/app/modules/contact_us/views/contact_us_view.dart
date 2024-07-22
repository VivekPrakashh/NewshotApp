import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);

  launchEmail() async {
    await launchUrlString("mailto:contact@revealinside.in");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.contact.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 20, color: Get.theme.colorScheme.onBackground),
                children: [
                  const TextSpan(
                      text:
                          "In case you have any issues with the news provided, please contact us by writing to us at -\n\n"),
                  TextSpan(
                      text: "contact@revealinside.in",
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontSize: 24,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchEmail();
                        })
                ]),
          ),
        ),
      ),
    );
  }
}
