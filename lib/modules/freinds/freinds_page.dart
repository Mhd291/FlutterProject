import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/components/freind_request_item.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../constants.dart';
import 'freinds_controller.dart';

class Freinds extends StatelessWidget {
  FriendRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Friends",
          style: TextStyle(color: kPrimaryColor),
        ),
        actions: [],
      ),
      body: SafeArea(
          // color: kBackgroundColor,
          child: Stack(
            children: [
              Positioned(
                child: ListView(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/allusers');
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Suggestions",
                                style: TextStyle(color: kBackgroundColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                        GestureDetector(
                          onTap: (){ Get.toNamed('/my_friends');},
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Your Friends",
                                style: TextStyle(color: kBackgroundColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Container(
                      child: Obx(() {
                        if (controller.isloading.isTrue) {
                          return Center(
                            child: const CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          );
                        } else {
                          return Column(
                            children:
                            List.generate(controller.requestslist.length, (index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(

                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: FriendRequestItem(
                                        name: "${controller.requestslist[index].name}",
                                        job: "${controller.requestslist[index].job}",
                                        img: Image.network(
                                            "${Uri.parse(ServerConfig.DNS + "/" + controller.requestslist[index].path + "/" + controller.requestslist[index].profilePhoto)}"),
                                        lastname:
                                        "${controller.requestslist[index].lastname}",
                                        accept: () async {
                                          print("wewewewewew");
                                          EasyLoading.show(status: "Loading..");
                                          await controller.Accept(
                                              controller.requestslist[index].id);

                                          if (controller.acceptStatues == true) {
                                            EasyLoading.showSuccess('Accept Successfully');
                                          } else {
                                            EasyLoading.showError('Error');
                                          }
                                        },
                                        deny: () async{
                                          print("wewewewewew");
                                          EasyLoading.show(status: "Loading..");
                                          await controller.Deny(
                                              controller.requestslist[index].id);

                                          if (controller.acceptStatues == true) {
                                            EasyLoading.showSuccess('Denyed Successfully');
                                          } else {
                                            EasyLoading.showSuccess('Denyed Successfully');
                                          }
                                        },
                                      ),
                                    ),
                                    onTap: (){
                                      Get.toNamed('/request_friend',arguments: controller.requestslist[index].id);
                                    },
                                  )
                                ],
                              );
                            }),
                          );
                        }
                      }),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 50,
                  child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05
                        , 0, MediaQuery.of(context).size.width*0.05, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kBackgroundColor,

                      ),

                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            Get.toNamed('/home');
                          }, icon: Icon(Icons.home,)),
                          IconButton(onPressed: (){Get.toNamed('/fr_re');}, icon: Icon(Icons.groups,color: kPrimaryColor,)),
                          IconButton(onPressed: (){Get.toNamed('/myprofile');}, icon: Icon(Icons.account_circle)),
                          IconButton(onPressed: (){Get.toNamed('/market');}, icon: Icon(Icons.shopping_cart)),
                          IconButton(onPressed: (){Get.toNamed('/noti');}, icon:  Icon(Icons.notifications)),
                        ],
                      ),
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
