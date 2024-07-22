import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/colors.dart';
import '../controllers/image_preview_controller.dart';

class ImagePreviewView extends GetView<ImagePreviewController> {
  const ImagePreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
      ),
      body: InteractiveViewer(
        child: Center(
          child: Hero(
            tag: controller.imageUrl,
            child: CachedNetworkImage(
              imageUrl: controller.imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
