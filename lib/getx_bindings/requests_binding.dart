import 'package:get/get.dart';
import 'package:monfy_app/modules/freinds/freinds_controller.dart';

class FriendRequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FriendRequestController>(()=>FriendRequestController());
  }
  }