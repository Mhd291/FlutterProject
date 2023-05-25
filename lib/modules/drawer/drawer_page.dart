import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:monfy_app/modules/all_users/all_users_screen.dart';
import 'package:monfy_app/modules/drawer/drawer_controller.dart';
import 'package:monfy_app/modules/home/home_page.dart';
import 'package:monfy_app/modules/notification/notification_page.dart';
import 'package:monfy_app/modules/settings/settings_page.dart';
import 'menupage.dart';


class DrawerPage extends StatelessWidget {
  DrawerController1 controller = Get.put(DrawerController1());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerController1>(
        init: DrawerController1(),
        builder: (controller) {
          return ZoomDrawer(
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.bounceIn,
            borderRadius: 40,
            angle: -10,
            slideWidth: MediaQuery
                .of(context)
                .size
                .width * 0.6,
            showShadow: true,
            menuBackgroundColor: Colors.indigo,
            style: DrawerStyle.defaultStyle,

            menuScreen: Builder(
                builder: (context) {
                  return MenuPage(
                    currentItem: controller.currentItem,
                    onSelectedItem: (item) {
                      controller.ChangeItem(item);
                      ZoomDrawer.of(context)!.close();
                    },);
                }
            ),
            mainScreen: getScreen(controller.currentItem),
          );
        });
  }

  Widget getScreen(var currentItem) {
    switch (currentItem) {
      case MenuItems.home:
        return Home();
      case MenuItems.allusers:
        return AllUsers();
      case MenuItems.notification:
        return MyNotification();
      case MenuItems.settigs:
      default:
        return Settings();
    }
  }
}
