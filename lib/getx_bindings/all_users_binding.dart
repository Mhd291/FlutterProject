import 'package:get/get.dart';
import 'package:monfy_app/modules/all_users/all_users_controller.dart';

class AllUsersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AllUsersController>(()=>AllUsersController());
  }


}