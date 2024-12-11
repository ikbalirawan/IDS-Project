import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/core.dart';

class ListPictureView extends StatelessWidget {
  final controller = Get.find<ListPictureController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Photo")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.pictures.length,
          itemBuilder: (context, index) {
            var picture = controller.pictures[index];
            return ListContentWidget(
              picture: picture,
              onTap: () => Get.toNamed(Routes.DETAIL, arguments: picture['id']),
            );
          },
        );
      }),
    );
  }
}
