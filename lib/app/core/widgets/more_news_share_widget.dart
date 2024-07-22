import 'package:flutter/material.dart';
import 'package:news_shots_app/app/core/widgets/news_list_card.dart';

import '../../data/models/news/news.dart';
import '../gen/assets.gen.dart';

class MoreNewsShareWidget extends StatelessWidget {
  final List<News> news;
  const MoreNewsShareWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (news.length * 100) + 320,
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "More News",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              ...news.map(
                (e) => NewsListCard(news: e, onTap: () {}),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Download our app for more news.\nStay informed, stay trendy.",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child:
                              Image.asset(Assets.images.logo.path, width: 37),
                        ),
                        const Text(
                          "Reveal Inside",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      Assets.images.download.path,
                      width: 140,
                      height: 140,
                      // fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
