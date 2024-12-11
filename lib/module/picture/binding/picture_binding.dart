import 'package:get/get.dart';
import 'package:miniproject/core.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListPictureController());
    Get.lazyPut(() => DetailPictureController());
  }
}
