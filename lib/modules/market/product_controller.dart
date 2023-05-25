import 'package:get/get.dart';

class ProductController extends GetxController{
  var argumentData = Get.arguments;
  var name;
  var region;
  var details;
  var price;
  var img;

  @override
  void onInit() {
     argumentData = Get.arguments;
    name=argumentData['name'];
    details=argumentData['dec'];
    region=argumentData['region'];
    price=argumentData['price'];
    img=argumentData['img'];
    print(img);
    super.onInit();
  }
}
