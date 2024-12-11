import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String imageUrl; // URL gambar yang akan dimuat
  final double height; // Tinggi gambar
  final double width; // Lebar gambar
  final BoxFit fit; // Penyesuaian gambar dalam kotak

  const LoadingWidget({
    Key? key,
    required this.imageUrl,
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Placeholder saat gambar sedang dimuat
        const Center(
          child: CircularProgressIndicator(),
        ),
        // Gambar asli dengan kontrol loading
        Image.network(
          imageUrl,
          height: height,
          width: width,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(
                Icons.broken_image,
                color: Colors.red,
                size: 50,
              ),
            );
          },
        ),
      ],
    );
  }
}
