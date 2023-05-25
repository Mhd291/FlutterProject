import 'package:get/get.dart';
import 'package:monfy_app/native_services/secure_storage.dart';

class SplashController extends GetxController{



  late SecureStorage _storage;

  @override
  void onInit() {
    _storage = SecureStorage();
    checkToken();
    super.onInit();


  }
  @override
  void onReady() {

    super.onReady();

  }

  Future<void> checkToken ()async{
    String? token = await _storage.read('token');
    print(token);

    if(token != null)
    {
      Get.offAllNamed('/home');
    }
    else{
      Get.offNamed('/login');
    }
  }

}