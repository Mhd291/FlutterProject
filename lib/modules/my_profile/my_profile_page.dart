import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:monfy_app/components/post_container.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:monfy_app/constants.dart';
import 'my_profile_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:mime/mime.dart';
class MyProfile extends GetView<MyProfileController> {
  static const double pImageHeightClosed = 400;
  double pIH = pImageHeightClosed;
  MyProfileController controller1 =Get.find() ;


  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.63;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.83;
    var maincolor =kPrimaryColor;
    return Scaffold(
      //backgroundColor: maincolor,
      body: SafeArea(
            child: Stack(
              children: [
                Positioned(child: Obx((){
                  if(controller1.isloading.isTrue){
                    return Center(
                      child: const CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );}
                  else {return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.7,
                        child: Stack(
                          children: [
                            Container(

                              child:  (controller1.coverimagename != null)?Image.network("${Uri.parse(ServerConfig.DNS+"/"+controller1.path+"/"+controller1.coverimagename)}"):Image.asset('assets/images/cover.jpg'),
                              width: MediaQuery.of(context).size.width,
                              //  height:MediaQuery.of(context).size.height,

                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                      //  Get.offNamed('/dashboard');
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: 'Options',
                                          content:Column(
                                            children: [
                                              ExpandablePanel(
                                                collapsed: const SizedBox.shrink(),
                                                expanded:ExpandBuilder2(maincolor),
                                                header: const Text('Change personal photo'),
                                              ),
                                              ExpandablePanel(
                                                collapsed: const SizedBox.shrink(),
                                                expanded:ExpandBuilder1(maincolor),
                                                header: const Text('Change cover photo'),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  Get.toNamed('/edit',arguments:
                                                  {
                                                    'name':'${controller1.name}',
                                                    'lastname':'${controller1.lastname}',
                                                    'jop':'${controller1.job}',
                                                    'email':'${controller1.email}',
                                                    'study':'${controller1.study}',
                                                    'date':'${controller1.birthdate}'
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.edit),
                                                    Text("Change Your Personal Information"),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          textCancel: "Cancel",
                                          cancelTextColor: maincolor,
                                          buttonColor: maincolor,
                                        );
                                      },
                                      icon: const Icon(Icons.more_vert)
                                  ),
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
                                topRight: Radius.circular(30)),
                            panelBuilder: (ScrollController controller) =>
                                Padding(
                                  padding: const EdgeInsets.only(top: 35),
                                  child: _panelBody(controller, context,maincolor),
                                ),
                            onPanelSlide: (position) {
                              controller1.panelHeightOpen = panelHeightOpen;
                              controller1.panelHeightClosed = panelHeightClosed;
                              controller1.position = position;
                              controller1.pIH = pIH;
                              controller1.personalImageMove();
                            },
                          ),
                          GetBuilder<MyProfileController>(builder: (controller) {
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
                                        child:  (controller.personalimagename != null)?Image.network("${Uri.parse(ServerConfig.DNS+"/"+controller1.path+"/"+controller1.personalimagename)}"):Image.asset('assets/images/person.jpg'),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),

                    ],
                  );}
                }),),
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
                              Get.offNamed('/home');
                            }, icon: Icon(Icons.home)),
                            IconButton(onPressed: (){Get.toNamed('/fr_re');}, icon: Icon(Icons.groups)),
                            IconButton(onPressed: (){Get.offNamed('/myprofile');}, icon: Icon(Icons.account_circle,color: kPrimaryColor,)),
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

  /// panel Body
  SingleChildScrollView _panelBody(
      ScrollController controller, BuildContext context,Color maincolor) {

    return SingleChildScrollView(
      controller: controller,
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
            child: Row(
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
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: () {},
                  child:  Column(
                    children:  [
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
                      "array":controller1.freinds
                        }
                    );
                  },
                  child:  Column(
                    children:  [
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
                  onPressed: (){
                    ShowInfo(controller1.email,
                       "${ controller1.gender}",
                       "${ controller1.birthdate}",
                        "${controller1.job}",
                        "${controller1.study}");
                  },
                  child:  Column(
                    children:  [
                      Icon(
                        Icons.more_horiz,
                        color: maincolor,
                      ),
                      Text(
                        ' Details ',
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
                           print(controller1.posts[index].images);
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
                            postImage:(controller1.posts[index].images.length !=0)&&(lookupMimeType("${controller1.posts[index].images[0].name}")!.split('/').first !=
                                "video")?"${controller1.posts[index].images[0].name}" :null,
                            numOfLikes: controller1.posts[index].likes.length,
                            numOfComments: controller1.posts[index].comment.length,
                            isLiked:(controller1.posts[index].isliked !=1)?false.obs:true.obs,
                          onTapLike: ()async{
                            await controller1.makeLike(controller1.posts[index].images[0].postId);

                            await controller1.fetchh();
                          } ,
                          onTapComment: (){
                            Get.toNamed('/comment', arguments: controller1.posts[index].id);
                          },
                          delete: (){
                            return Get.defaultDialog(
                              title: 'Options',
                              content: GestureDetector(
                                onTap: ()async{
                                  await controller1.DeletePost(controller1.posts[index].id);

                                  await controller1.fetchh();
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text("Delete Post"),
                                      SizedBox(width: 30,),
                                      Icon(Icons.delete),
                                    ],
                                  ),
                                ),
                              ),
                              textCancel: "Cancel",
                              cancelTextColor: kPrimaryColor,
                              buttonColor: kPrimaryColor,
                            );
                          },


                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
  Widget ExpandBuilder1(Color maincolor){
    return Column(
      children: [
        MaterialButton(
          onPressed:(){
            controller1.getCoverImage(ImageSource.gallery);
            Get.back();
          },
          child: Row(
            children: const [
              Icon(Icons.image_outlined),
              Text("Choose from Gallery")
            ],
          ),
        ),
        MaterialButton(
          onPressed:(){
            controller1.getCoverImage(ImageSource.camera);
            Get.back();
          },
          child: Row(
            children: const [
              Icon(Icons.camera_alt_outlined),
              Text("Choose from Camera")
            ],
          ),
        )
      ],
    );
  }
  Widget ExpandBuilder2(Color maincolor){
    return Column(
      children: [
        MaterialButton(
          onPressed:(){
            controller1.getPersonalImage(ImageSource.gallery);
            Get.back();
          },
          child: Row(
            children: const [
              Icon(Icons.image_outlined),
              Text("Choose from Gallery")
            ],
          ),
        ),
        MaterialButton(
          onPressed:(){
            controller1.getPersonalImage(ImageSource.camera);
            Get.back();
          },
          child: Row(
            children: const [
              Icon(Icons.camera_alt_outlined),
              Text("Choose from Camera")
            ],
          ),
        )
      ],
    );
  }

     Future<void> _HandleRefresh() async
      {
        //return Future.delayed(Duration(seconds: 2));
      }
  Future  ShowInfo(String email, String gender, String birthdate, String job, String study) {

    TextEditingController getEmail = TextEditingController();
    TextEditingController getGender = TextEditingController();
    TextEditingController getBirthdate = TextEditingController();
    TextEditingController getJob = TextEditingController();
    TextEditingController getStudy = TextEditingController();
    getEmail.text = email;
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
              controller: getEmail,
              decoration: InputDecoration(
                prefix: Text('Email:'),
              ),
            ),
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