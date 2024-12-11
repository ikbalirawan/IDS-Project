import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/core.dart';

class ListPictureView extends StatelessWidget {
  final controller = Get.find<ListPictureController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Tinggi app bar
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF5722), // Warna pertama
                Color(0xFFFFC107), // Warna kedua
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: const Text("List Foto"),
            backgroundColor: Colors.transparent, // Membuat background app bar transparan
            elevation: 0, // Menghilangkan shadow pada app bar
          ),
        ),
      ),
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
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.pictures.length,
                  itemBuilder: (context, index) {
                    var picture = controller.pictures[index];
                    return ListContentWidget(
                      picture: picture,
                      onTap: () =>
                          Get.toNamed(Routes.DETAIL, arguments: picture['id']),
                    );
                  },
                );
              }),
            );
          },
        );
      }),
    );
  }
}
