import 'package:flutter/material.dart';
import 'package:monfy_app/components/post_container.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:monfy_app/config/user_info.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/modules/home/home_controller.dart';
import 'package:get/get.dart';


 class Home extends StatelessWidget {

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Monfy',
          style: TextStyle(color: kPrimaryColor,fontSize:30,fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,

        shape: const RoundedRectangleBorder(
          //  borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
            side: BorderSide(
              color: kPrimaryColor,
            )
        ),
        bottom: PreferredSize(preferredSize: Size.fromHeight(80), child:Container(
          color: Colors.white,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(7),
                child:  Container(

                  child: ClipOval(
                    child: (UserInfo.imageprofilename != null)? Image.network("${Uri.parse(ServerConfig.DNS+"/users/"+UserInfo.imageprofilename)}"):Image.asset('assets/images/person.jpg'),

                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.08,
                  width: MediaQuery
                      .of(context)
                      .size
                      .height * 0.08,
                ),),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              GestureDetector(
                onTap: (){Get.toNamed('/add_post');
                print(UserInfo.path);
                },
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Text("What are you thinking about...?       ",style: TextStyle(fontSize: 17),)),
                ),
              ),
            ],
          ),
        ),),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.messenger,
                color: kPrimaryColor,
              )),
          IconButton(
              onPressed: () {
                Get.toNamed('/search');
              },
              icon: const Icon(
                Icons.search,
                color: kPrimaryColor,
              )),

        ],
      ),
      body: RefreshIndicator(

    onRefresh: ()=>controller.onInit(),
    color: kPrimaryColor,

    backgroundColor: Colors.purple[200],


    child: Stack(
      children:[ Positioned(
        child: Container(
          child: Obx(() {
                  if (controller.isloading.isTrue) {
                    return Center(
                      child: const CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  } else {
                    return
                      Stack(
                        children: [
                      Positioned(
                      child: ListView(
                      children: List.generate(controller.postlist.length, (index) {
                        print(controller.postlist[index].images);
                        return Column(
                          children: [

                            SizedBox(
                              height: 15,
                            ),
                            PostContaioner(personalImage: Image.network(

                                "${Uri.parse(ServerConfig.DNS + "/users/" + controller.postlist[index].userProfilePhoto)}")
                              ,personalName: "${controller.postlist[index].userName} ${controller.postlist[index].userLastname}",
                              postDate: controller.postlist[index].createdAt,
                              postText: "${controller.postlist[index].body}",
                              postImage:(controller.postlist[index].images.length !=0)?controller.postlist[index].images[0].name:null,
                              numOfLikes: controller.postlist[index].likes.length,
                              numOfComments: controller.postlist[index].comment.length,
                              isLiked:(controller.postlist[index].isliked !=1)?false.obs:true.obs, onTapLike: ()async{
                              await controller.makeLike(controller.postlist[index].id);

                              await controller.fetchh();
                              } ,
                              onTapComment: (){
                                Get.toNamed('/comment', arguments: controller.postlist[index].id);
                              },


                            ),
                          ],
                        );
                      }),

            ),
            ),

                        ],
                      );
                  }
                }),
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
                      controller.fetchh();
                    }, icon: Icon(Icons.home,color: kPrimaryColor,)),
                    IconButton(onPressed: (){
                      Get.toNamed('/Fr_re');
                    }, icon: Icon(Icons.groups)),
                    IconButton(onPressed: (){Get.toNamed('/myprofile');}, icon: Icon(Icons.account_circle)),
                    IconButton(onPressed: (){Get.toNamed('/market');}, icon: Icon(Icons.shopping_cart)),
                    IconButton(onPressed: (){Get.toNamed('/noti');}, icon:  Icon(Icons.notifications)),
                  ],
                ),
              ),
            )
        )],
    ),
        ),
    );

  }
}
