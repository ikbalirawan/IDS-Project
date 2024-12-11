import 'package:flutter/material.dart';
import 'package:miniproject/core.dart';

class DetailContentWidget extends StatelessWidget {
  final String imageUrl;
  final String author;

  const DetailContentWidget({
    Key? key,
    required this.imageUrl,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Ganti Image.network dengan LoadingWidget
        LoadingWidget(
          imageUrl: imageUrl,
          height: 300,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight, // Posisi teks di kanan
            child: Text(
              "Taken by: $author",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
