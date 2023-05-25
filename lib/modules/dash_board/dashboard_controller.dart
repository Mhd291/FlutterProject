import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monfy_app/modules/home/home_page.dart';
import 'package:monfy_app/modules/home/home_controller.dart';
class DashBoardController extends GetxController{
  var tabindex=0.obs;

  void changeTabIndex(int index)
  {
    tabindex(index);
    update();
  }
  // List<StatelessWidget> screens(DashBoardController controller){
  //   return [
  //     Home(homecontroller:controller,)
  //   ];
  // }
}