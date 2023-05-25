

import 'package:flutter/material.dart';
import 'package:monfy_app/components/freind_item.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/modules/all_users/all_users_controller.dart';
import 'package:get/get.dart';
import 'package:monfy_app/modules/search/search_controller.dart';
import 'package:monfy_app/modules/user_profile/user_profiile_screen.dart';
import 'package:monfy_app/modules/user_profile/user_profile_controller.dart';

class Search extends StatelessWidget {
  SearchController controller = Get.put(SearchController());
  UserProfileController controller2 = UserProfileController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Container(
          child: Stack(
            children:[
              Positioned(
                top: 20,
                child: Row(
                  children:[ Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.grey[200]
                    ),
                    child:  TextField(

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search)


                      ),
                      onChanged: (value){
                          controller.search=value;
                      },
                    ),
                  ),
                    IconButton(onPressed: ()async{
                        await controller.Search();
                    },
                        icon: Icon(Icons.search))
                  ],
                ),),
              Obx(() {
              if (controller.isloading.isFalse){
                return Container();
              }
              if (controller.isSearch.isTrue) {
                return const Center(
                  child:  CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              } else {
                return ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.08,
                    ),
                Column(
                children: List.generate(controller.userlist.length, (index) {
                  if(controller.search=="all")
                    {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          FriendItem(
                              img: Image.network(
                                  "${Uri.parse(ServerConfig.DNS + "/users/" + controller.userlist[index].profilePhoto)}"),
                              name: "${controller.userlist[index].name}",
                              lastname: "${controller.userlist[index].lastname}",
                              job: "${controller.userlist[index].job}",
                              study: "${controller.userlist[index].study}",
                              ontap: () async {
                                Get.toNamed('/userprofile',
                                    arguments: controller.userlist[index].id);
                                controller2.onClickUser();
                                print("Iam user");
                              })
                        ],
                      );
                    }
                  else{
                    return (controller.search=="${controller.userlist[index].name}"
                    || controller.search=="${controller.userlist[index].name}"+" "+ "${controller.userlist[index].lastname}"
                    )?Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        FriendItem(
                            img: Image.network(
                                "${Uri.parse(ServerConfig.DNS + "/users/" + controller.userlist[index].profilePhoto)}"),
                            name: "${controller.userlist[index].name}",
                            lastname: "${controller.userlist[index].lastname}",
                            job: "${controller.userlist[index].job}",
                            study: "${controller.userlist[index].study}",
                            ontap: () async {
                              Get.toNamed('/userprofile',
                                  arguments: controller.userlist[index].id);
                              controller2.onClickUser();
                              print("Iam user");
                            })
                      ],
                    ):Container();
                  }

                }),
                )
                  ],
                );
              }
            }),]
          ),
        ));
  }
}
