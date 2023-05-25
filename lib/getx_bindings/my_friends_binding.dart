import 'package:get/get.dart';
import 'package:monfy_app/modules/my_friends/my_friends_controller.dart';

class MyFriendsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MyFriendsController>(()=>MyFriendsController());
  }


}