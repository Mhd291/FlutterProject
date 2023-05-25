import 'package:get/get.dart';

class ImageController extends GetxController{


  var image;

  @override
  void onInit() {
    image = Get.arguments;
    super.onInit();
  }
}