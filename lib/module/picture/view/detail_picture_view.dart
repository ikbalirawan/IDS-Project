import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/core.dart';

class DetailPictureView extends StatelessWidget {
  final controller = Get.find<DetailPictureController>();

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments;
    controller.fetchPictureDetail(id);

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Photo")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        var detail = controller.pictureDetail;
        return DetailContentWidget(
          imageUrl: detail['download_url'],
          author: detail['author'],
        );
      }),
    );
  }
}
