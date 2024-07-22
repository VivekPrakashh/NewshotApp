import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Get.arguments is Widget
        ? Get.arguments
        : Scaffold(
            appBar: AppBar(
              title: const Text('DemoView'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [Text(Get.arguments.toString())],
              ),
            ),
          );
  }
}
