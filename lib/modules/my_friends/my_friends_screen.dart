

import 'package:flutter/material.dart';
import 'package:monfy_app/components/freind_item.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/modules/all_users/all_users_controller.dart';
import 'package:get/get.dart';
import 'package:monfy_app/modules/my_friends/my_friends_controller.dart';
import 'package:monfy_app/modules/user_profile/user_profiile_screen.dart';
import 'package:monfy_app/modules/user_profile/user_profile_controller.dart';

class My_Freinds extends StatelessWidget {
  MyFriendsController controller = Get.find();
  UserProfileController controller2 = UserProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Your Friends"),
        ),
        body: Container(
          child: Obx(() {
            if (controller.isloading.isTrue) {
              return Center(
                child: const CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            } else {
              return ListView(
                children: List.generate(controller.userlist.length, (index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      FriendItem(
                          img: Image.network(
                              "${Uri.parse(ServerConfig.DNS + "/users/" + controller.userlist[index].profilePhoto)}"),
                          name: "${controller.userlist[index].name}",
                          lastname: "${controller.userlist[index].lastname}",
                          job: "${controller.userlist[index].job}",
                          study: "${controller.userlist[index].study}",
                          ontap: () async {
                            Get.toNamed('/friend_profile',
                                arguments: controller.userlist[index].id);
                            controller2.onClickUser();
                            print("Iam user");
                          })
                    ],
                  );
                }),
              );
            }
          }),
        ));
  }
}
