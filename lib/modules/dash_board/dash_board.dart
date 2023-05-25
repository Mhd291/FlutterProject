import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/modules/dash_board/dashboard_controller.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:monfy_app/modules/freinds/freinds_page.dart';
import 'package:monfy_app/modules/home/home_page.dart';
import 'package:monfy_app/modules/market/market_page.dart';
import 'package:monfy_app/modules/my_profile/my_profile_page.dart';
import 'package:monfy_app/modules/notification/notification_page.dart';
import 'package:monfy_app/modules/settings/settings_page.dart';
class Dashboard extends StatelessWidget {

DashBoardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder:(controller){
      return Scaffold(

        body:  Container(
            child: IndexedStack(
              index: controller.tabindex.value,
              children: [
              
              ],
            ),
          ),



        extendBody: true,
        bottomNavigationBar:Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(

                  marginR: EdgeInsets.all(10),
                  paddingR: EdgeInsets.only(bottom: 5, top: 5),

                  onTap: controller.changeTabIndex,
                  currentIndex: controller.tabindex.value,
                  items: [

                    DotNavigationBarItem (icon: Icon(Icons.home),
                      selectedColor: kPrimaryColor,
                    ),
                    DotNavigationBarItem (icon: Icon(Icons.groups),
                      selectedColor: kPrimaryColor,

                    ),
                    DotNavigationBarItem(icon: Icon(Icons.account_circle),
                      selectedColor: kPrimaryColor,
                    ),
                    DotNavigationBarItem (icon: Icon(Icons.shopping_cart),
                      selectedColor: kPrimaryColor,
                    ),

                    DotNavigationBarItem(icon: Icon(Icons.notifications),
                      selectedColor: kPrimaryColor,
                    ),
                    DotNavigationBarItem(icon: Icon(Icons.menu),
                      selectedColor: kPrimaryColor,
                    ),

                  ],



          ),
        ),

      );

    }
    );
  }
}