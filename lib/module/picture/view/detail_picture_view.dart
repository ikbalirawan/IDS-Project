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
      appBar: AppBar(title: const Text("Detail Foto")),
      body: Obx(() {
        // Memastikan widget hanya dibangun ketika status loading berubah
        return TweenAnimationBuilder(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: controller.isLoading.value ? Alignment.bottomRight : Alignment.topRight, // Posisi gradient berubah tergantung status loading
          ),
          duration: const Duration(seconds: 5),
          builder: (context, Alignment alignment, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF5722), // Warna pertama
                    Color(0xFFFFC107), // Warna kedua
                  ],
                  begin: alignment, // Gradient bergerak berdasarkan posisi
                  end: Alignment.bottomRight,
                ),
              ),
              child: controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : DetailContentWidget(
                      imageUrl: controller.pictureDetail['download_url'],
                      author: controller.pictureDetail['author'],
                    ),
            );
          },
        );
      }),
    );
  }
}
