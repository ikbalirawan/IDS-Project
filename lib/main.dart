import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Project',
      initialRoute: Routes.PHOTOS,
      getPages: AppPages.routes,
    );
  }
}
