import 'package:flutter/material.dart';
import 'package:miniproject/core.dart';

class ListContentWidget extends StatelessWidget {
  final dynamic picture; // Data gambar (sebuah map)
  final VoidCallback onTap; // Callback saat item ditekan

  const ListContentWidget({
    Key? key,
    required this.picture,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            // Ganti Image.network dengan LoadingWidget
            LoadingWidget(
              imageUrl: picture['download_url'],
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight, // Posisi teks di kanan
                child: Text(
                  "by: ${picture['author']}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
