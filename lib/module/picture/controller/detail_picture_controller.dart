import 'package:get/get.dart';
import 'package:miniproject/core.dart';

class DetailPictureController extends GetxController {
  var pictureDetail = {}.obs;
  var isLoading = true.obs;

  void fetchPictureDetail(String id) async {
    isLoading.value = true;
    try {
      pictureDetail.value = await PictureService().fetchPictureDetail(id);
    } finally {
      isLoading.value = false;
    }
  }
}
