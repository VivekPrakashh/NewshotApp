import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/data/db/database.dart';

class HighlightedClickableText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final void Function(String text) onClick;
  final bool enableTextSelection;

  final List<String> highlightedWords;

  const HighlightedClickableText({
    super.key,
    required this.text,
    required this.highlightedWords,
    required this.onClick,
    required this.style,
    this.enableTextSelection = false,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Get.find<AppLocalDB>().localSessionsDao.getHideDoubtsStreams(),
      builder: (context, snapshot) {
        final hideDoubts = snapshot.data ?? false;
        if (enableTextSelection) {
         
          return SelectableText.rich(
            TextSpan(
              text: hideDoubts ? text : null,
              style: style,
              children: hideDoubts ? null : _buildTextSpans(),
            ),
          );
        } else {
          return RichText(
            maxLines: 2,
            
            text: TextSpan(
              text: hideDoubts ? text : null,
              style: style,
              children: hideDoubts ? null : _buildTextSpans(),
            ),
          );
        }
      },
    );
  }

  bool isAlphanumeric(String char) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(char);
  }

  List<TextSpan> _buildTextSpans() {
    List<TextSpan> spans = [];
    String remaining = text.toLowerCase();
    int processedLength = 0;

    List<String> sortedHighlightedWords = highlightedWords
        .map((word) => word.toLowerCase())
        .toList()
      ..sort((a, b) => b.length.compareTo(a.length));

    while (remaining.isNotEmpty) {
      int earliestIndex = remaining.length;
      String? toHighlight;

      for (String word in sortedHighlightedWords) {
        int index = remaining.indexOf(word);
        if (index != -1 && index < earliestIndex) {
          earliestIndex = index;
          toHighlight = word;
        }
      }

      if (toHighlight != null) {
        if (earliestIndex > 0) {
          spans.add(TextSpan(
              text: text.substring(
                  processedLength, processedLength + earliestIndex)));
        }
        int startIdx = processedLength + earliestIndex;
        int endIdx = startIdx + toHighlight.length;
        endIdx = endIdx > text.length ? text.length : endIdx;

        if ((startIdx == 0 || !isAlphanumeric(text[startIdx - 1])) &&
            (endIdx == text.length || !isAlphanumeric(text[endIdx]))) {
          spans.add(
            TextSpan(
              text: text.substring(startIdx, endIdx),
              style: style.copyWith(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
                // decorationThickness: 1,
                decorationColor: Get.theme.dividerColor.withOpacity(0.5),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onClick(toHighlight ?? "");
                },
            ),
          );
        } else {
          spans.add(TextSpan(text: text.substring(startIdx, endIdx)));
        }

        processedLength = endIdx;
        remaining = remaining.substring(earliestIndex + toHighlight.length);
      } else {
        spans.add(TextSpan(text: text.substring(processedLength)));
        break;
      }
    }

    return spans;
  }
}
