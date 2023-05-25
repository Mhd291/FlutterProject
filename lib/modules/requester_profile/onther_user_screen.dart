import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/components/post_container.dart';
import 'package:monfy_app/modules/requester_profile/another_user_controller.dart';

import 'package:monfy_app/config/server_config.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../constants.dart';

class RequesterProfile extends StatelessWidget {
  static const double pImageHeightClosed = 400;
  double pIH = pImageHeightClosed;
  var id=Get.arguments;
  RequesterProfileController controller1 = Get.put(RequesterProfileController());



  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.73;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.83;
    var maincolor = kPrimaryColor;
    return Scaffold(
      body: SafeArea(child: Obx(() {
        if (controller1.isloading.isTrue) {
          return Center(
            child: const CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        } else {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.7,
                child: Stack(
                  children: [
                    Container(
                      child: (controller1.coverimagename != null)
                          ? Image.network("${Uri.parse(ServerConfig.DNS+"/"+controller1.path+"/"+controller1.coverimagename)}")
                          : Image.asset('assets/images/cover.jpg'),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.offNamed('/dashboard');
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.3,
                child: Container(
                  color: kBackgroundColor,
                ),
              ),

              ///Sliding Panel
              Stack(
                children: [
                  SlidingUpPanel(
                    color: const Color.fromARGB(255, 241, 240, 242),
                    parallaxEnabled: true,
                    parallaxOffset: .5,
                    minHeight: panelHeightClosed,
                    maxHeight: panelHeightOpen,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(80)),
                    panelBuilder: (ScrollController controller1) => Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: _panelBody(
                        controller1,
                        context,
                        maincolor,
                      ),
                    ),
                    onPanelSlide: (position) {
                      controller1.panelHeightOpen = panelHeightOpen;
                      controller1.panelHeightClosed = panelHeightClosed;
                      controller1.position = position;
                      controller1.pIH = pIH;
                      controller1.personalImageMove();
                    },
                  ),
                  GetBuilder<RequesterProfileController>(builder: (controller) {
                    return Positioned(
                      left: 30,
                      bottom: controller.pIH,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            width: 125,
                            height: 125,
                          ),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Container(
                              child: ClipOval(
                                child: (controller.personalimagename != null)
                                    ? Image.network("${Uri.parse(ServerConfig.DNS+"/"+controller.path+"/"+controller.personalimagename)}")
                                    : Image.asset('assets/images/person.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              )
            ],
          );
        }
      })),

    );
  }

  /// panel Body///////////////////////////////////////////////////////
  SingleChildScrollView _panelBody(
      ScrollController controller,
      BuildContext context,
      Color maincolor,
      ) {
    return SingleChildScrollView(
        controller: controller,
        physics: const ClampingScrollPhysics(),
        child: GetBuilder<RequesterProfileController>(
          builder: (getcontroller) => Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          (controller1.name  != null && controller1.lastname  != null)?Text(
                            "${controller1.name} ${controller1.lastname}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ): Text(
                            "....",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          (controller1.gender  != null )?Text(
                            "${controller1.gender} ",
                            style: TextStyle(color: Colors.grey),
                          ): Text(
                            "....",
                            style: TextStyle(color: Colors.grey),
                          ),
                          (controller1.birthdate != null )?Text(
                            "${controller1.birthdate} ",
                            style: TextStyle(color: Colors.grey),
                          ): Text(
                            "....",
                            style: TextStyle(color: Colors.grey),
                          ),


                        ],
                      ),
                      Row(
                        children:
                        [
                          MaterialButton(
                            onPressed: ()async {
                              await controller1.DenyFriendRequest();
                            },
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)
                                ),
                                color: kPrimaryColor,
                              ),
                              child: const Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle
                                      (color: Colors.white),
                                  )
                              ),
                            ),
                          ),

                          MaterialButton(
                            onPressed: () async{
                              await controller1.AcceptFriendRequest();
                            },
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)
                                ),
                                color: kPrimaryColor,
                              ),
                              child: const Center(
                                  child: Text(
                                    'accept',
                                    style: TextStyle
                                      (color: Colors.white),
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.chat_rounded,
                            color: maincolor,
                          ),
                          Text(
                            'Chat',
                            style: TextStyle(color: maincolor),
                          ),
                        ],
                      )),
                  MaterialButton(
                      onPressed: () {
                        Get.toNamed('/any_friend'
                            ,arguments: {
                              "array":controller1.friends
                            }
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.supervisor_account,
                            color: maincolor,
                          ),
                          Text(
                            'Friends',
                            style: TextStyle(color: maincolor),
                          ),
                        ],
                      )),
                  MaterialButton(
                      onPressed: () {
                        ShowInfo(
                            "${ controller1.gender}",
                            "${ controller1.birthdate}",
                            "${controller1.job}",
                            "${controller1.study}");
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: maincolor,
                          ),
                          Text(
                            'Details ',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: maincolor),
                          ),
                        ],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(children: List.generate(controller1.posts.length, (index) {
                  //    print(controller1.posts[index].images);
                  return Column(
                    children: [

                      SizedBox(
                        height: 15,
                      ),
                      PostContaioner(personalImage: Image.network(

                          "${Uri.parse(ServerConfig.DNS + "/users/" + controller1.posts[index].userProfilePhoto)}")
                        ,personalName: "${controller1.posts[index].userName} ${controller1.posts[index].userLastname}",
                        postDate: controller1.posts[index].createdAt,
                        postText: "${controller1.posts[index].body}",
                        //   postImage:(controller1.posts[index].images.length !=0)?Image.network("${Uri.parse(ServerConfig.DNS + "/posts/" + "${controller1.posts[index].images[0].name}")}") :null,
                        numOfLikes: controller1.posts[index].likes.length,
                        numOfComments: controller1.posts[index].comment.length,
                        isLiked:(controller1.posts[index].isliked !=1)?false.obs:true.obs,
                        onTapLike: ()async{
                          await controller1.makeLike(controller1.posts[index].images[0].postId);

                          await controller1.fetchh();
                        } ,
                        onTapComment: (){
                          Get.toNamed('/comment', arguments: controller1.posts[index].images[0].postId);
                        },


                      ),
                    ],
                  );
                }),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _HandleRefresh() async {
    //return Future.delayed(Duration(seconds: 2));
  }
  Future  ShowInfo( String gender, String birthdate, String job, String study) {


    TextEditingController getGender = TextEditingController();
    TextEditingController getBirthdate = TextEditingController();
    TextEditingController getJob = TextEditingController();
    TextEditingController getStudy = TextEditingController();

    getGender.text = gender;
    getBirthdate.text = birthdate;
    getJob.text = job;
    getStudy.text = study;
    return Get.defaultDialog(
      title: 'Information',
      content: Container(
        child: Column(
          children: [


            TextField(
              enabled: false,
              controller: getGender,
              decoration: InputDecoration(
                prefix: Text('Gender:'),
              ),
            ),
            TextField(
              enabled: false,
              controller: getBirthdate,
              decoration: InputDecoration(
                prefix: Text('Birthdate:'),
              ),
            ),
            TextField(
              enabled: false,
              controller: getJob,
              decoration: InputDecoration(
                prefix: Text('Job:'),
              ),
            ),
            TextField(
              enabled: false,
              controller: getStudy,
              decoration: InputDecoration(
                prefix: Text('Study:'),
              ),
            ),
          ],
        ),
      ),
      textCancel: "Cancel",
      cancelTextColor: kPrimaryColor,
      buttonColor: kPrimaryColor,
    );
  }

}
