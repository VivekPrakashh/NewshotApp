import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermAndConditionDialog extends StatelessWidget {
  const TermAndConditionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.7,
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: const Text(
                "Term's and Conditions",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                children: const [
                  Text(
                    "Introduction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text("•	Welcome to Reveal Inside."),
                  Text(
                      "•	These Terms and Conditions govern your use of our mobile application."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Acceptance of Terms",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	By accessing and using Reveal Inside, you agree to be bound by these Terms and Conditions."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Service Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	Reveal Inside aggregates news from various sources, presenting it in a question-answer format and providing summaries and quizzes."),
                  Text(
                      "•	The service is for personal, non-commercial use only."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Intellectual Property Rights",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	All content provided through Reveal Inside is the property of their respective owners."),
                  Text(
                      "•	The app itself and all original content, features, and functionality are owned by Reveal Inside."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "User Obligations",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	Users must not use Reveal Inside for any unlawful purpose."),
                  Text(
                      "•	The redistribution or reproduction of part or all of the contents in any form is prohibited."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Content Accuracy and Reliability",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	Reveal Inside does not guarantee the accuracy, completeness, or reliability of information provided."),
                  Text(
                      "•	The app aggregates content from third-party sources and is not responsible for any errors or omissions."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Limitation of Liability",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	Reveal Inside, its directors, employees, partners, and affiliates will not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your access to or use of the service."),
                  Text(
                      "•	The app is not liable for any content inaccuracies or for any damages or loss resulting from the use of the content."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Indemnification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	You agree to defend, indemnify, and hold harmless Reveal Inside from any claim or demand made by any third party due to your breach of these Terms."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Changes to Terms and Conditions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	Reveal Inside reserves the right to modify these Terms at any time."),
                  Text(
                      "•	Continued use of the app following any such changes will indicate your acceptance of the new Terms."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Governing Law",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	These Terms are governed by and construed in accordance with the laws of Mumbai, Maharashtra, India."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Contact Information",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	For any questions or concerns regarding these Terms or any content, please contact us at contact@revealinside.in ."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Severability",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	If any provision of these Terms is held to be invalid or unenforceable, the remaining provisions will remain in effect."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Entire Agreement",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                      "•	These Terms constitute the entire agreement between you and Reveal Inside regarding the use of the app."),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              // width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Close")),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
