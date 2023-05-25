import 'package:get/get.dart';
import 'package:monfy_app/modules/dash_board/dashboard_controller.dart';
import 'package:monfy_app/modules/freinds/freind_service.dart';
import 'package:monfy_app/modules/freinds/freinds_controller.dart';
import 'package:monfy_app/modules/home/home_controller.dart';
import 'package:monfy_app/modules/market/market_controller.dart';
import 'package:monfy_app/modules/my_profile/my_profile_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies()
   {
   // Get.lazyPut<DashBoardController>(()=>DashBoardController());
   // Get.lazyPut<HomeController>(()=>HomeController());
   // Get.lazyPut<MyProfileController>(()=>MyProfileController());
   // Get.lazyPut<MarketController>(()=>MarketController());
//    Get.lazyPut<FriendRequestController>(()=>FriendRequestController());


   }

}