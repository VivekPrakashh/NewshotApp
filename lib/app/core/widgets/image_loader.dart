import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  final String url;
  const ImageLoader({
    super.key,
    required this.url,
  });

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  void retryImageLoad() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: widget.url,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
      errorWidget: (context, error, stackTrace) {
        return Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(child: Text("Failed to load Image")),
            IconButton(
                onPressed: () {
                  retryImageLoad();
                },
                icon: const Icon(Icons.replay_outlined))
          ],
        ));
      },
    );
  }
}
