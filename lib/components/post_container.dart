import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monfy_app/components/post_controller.dart';
import 'package:monfy_app/constants.dart';
import 'package:readmore/readmore.dart';
import 'package:like_button/like_button.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:mime/mime.dart';
import 'package:monfy_app/config/server_config.dart';

class PostContaioner extends StatelessWidget {
PostController controller = Get.put(PostController());
  var isReadMore = false.obs;


  var personalImage;
  String? personalName;
  DateTime? postDate;
  String postText;

  var postImage;
  final Function() onTapLike;
   final Function() onTapComment;
 Function()? delete;
  final key1 = GlobalKey<LikeButtonState>();


  //Image? img=Image.network("src");

var isInit =false.obs ;
  int? numOfLikes;
  int? numOfComments;
  RxBool isLiked ;
late VideoPlayerController videoPlayerController;
ChewieController? chewieController;
Future<void> initializePlayer() async{

  videoPlayerController=await VideoPlayerController.network("${Uri.parse(ServerConfig.DNS + "/posts/" + "${postImage}")}");

  await Future.wait([videoPlayerController.initialize()]);
  isInit(true);
  chewieController=ChewieController(videoPlayerController: videoPlayerController,
    autoPlay: false,
    looping: true,
    materialProgressColors: ChewieProgressColors(
      playedColor: Colors.red,
      handleColor: Colors.cyanAccent,
      backgroundColor: Colors.yellow,
      bufferedColor: Colors.lightGreen,
    ),

    autoInitialize: true,
  );


}


  PostContaioner({

    required this.personalImage,
    required this.personalName,
     this.postDate,
    required this.postText,
     this.postImage,
    required this.numOfLikes,
    required this.numOfComments,
    required this.isLiked,
    required this.onTapLike, required this.onTapComment, this.delete,


  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      //initializePlayer();
      print("obx obx obx obx obx obx obx obx ");
      if (isInit.isTrue || postText != null) {
        initializePlayer();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 20),
                  child: Row(
                    children: [
                      Container(

                        child: ClipOval(

                          child: personalImage,
                        ),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.06,
                        width: MediaQuery
                            .of(context)
                            .size
                            .height * 0.06,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  personalName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                DateFormat('dd-MM-yyyy').format(postDate!) ==
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.now())
                                    ? Text(
                                  DateFormat('hh:mm a').format(postDate!),
                                  style: const TextStyle(color: Colors.grey),
                                )
                                    : Text(
                                    DateFormat('dd/MM/yyyy ').format(postDate!),
                                    style: const TextStyle(color: Colors.grey))


                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: delete,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: buildText(postText),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01,),
                postImage != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                  height: 6.0,
                ),
                postImage != null
                    ? Container(
                    color: Colors.black87,
                    child: (lookupMimeType(postImage)!.split('/').first ==
                        "video") ?
                    GestureDetector(
                      onTap: ()async{
                        print("Heeeeeyyyyyyeyeyeyey");
                        await initializePlayer();

                      },
                      onDoubleTap: () {
                        Get.toNamed('/video_page', arguments: postImage);
                      },
                      child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.35,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.9,
                          child: chewieController != null &&
                              chewieController!.videoPlayerController.value
                                  .isInitialized ?
                          AspectRatio(

                            aspectRatio: chewieController!.videoPlayerController
                                .value.aspectRatio,
                            child: Chewie(
                              controller: chewieController!,
                            ),
                          ) :
                          Container(
                            color: Colors.black87,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.22,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 10,),
                                Text("Loading...",
                                  style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          )


                      ),
                    ) :
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/image',arguments: postImage);
                      },
                      child: Image.network("${Uri.parse(
                          ServerConfig.DNS + "/posts/" + postImage)}"),
                    )
                )

                    : const SizedBox.shrink(),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.005,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.011,
                    ),


                    OutlinedButton(
                      onPressed:
                          () async {

                        print("object");
                        key1.currentState!.onTap();
                        await onTapLike();
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size.fromWidth(170),
                        padding: EdgeInsets.zero,
                      ),
                      child: IgnorePointer(
                        child: LikeButton(
                          key: key1,
                          //onTap: onTapLike,
                          size: 30,
                          isLiked: isLiked.value,
                          likeCount: numOfLikes,
                          likeCountPadding: EdgeInsets.only(left: 12),
                          likeBuilder: (isLiked) {
                            final color = isLiked
                                ? kPrimaryColor
                                : kBackgroundColor;
                            return Icon(Icons.favorite, color: color, size: 30);
                          },
                          countBuilder: (count, isLiked, text) {
                            final color = kPrimaryColor;
                            return Text(text
                              , style: TextStyle(
                                color: color,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },

                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.01,
                    ),
                    Container(
                      color: Colors.black,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.005,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.05,
                    ),
                    SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.05
                    ),
                    InkWell(
                      onTap: onTapComment,
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.042,
                        child: OutlinedButton(

                          onPressed: null,
                          style: OutlinedButton.styleFrom(

                            fixedSize: Size.fromWidth(170),

                            padding: EdgeInsets.zero,
                          ),
                          child: MaterialButton(
                              onPressed: null,
                              child: Row(
                                children: [

                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.1,
                                  ),
                                  const Icon(
                                    Icons.comment, color: kPrimaryColor,),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.028,
                                  ),
                                  Text('$numOfComments', style: TextStyle(
                                      fontSize: 21, color: kPrimaryColor)),
                                ],
                              )),
                        ),
                      ),),
                  ],
                ),

              ],
            ),
          ),
        );
      }
      else {
        return Container(
          height: 200,
          color: kPrimaryColor,
        );
      }
    });
  }


  Widget buildText(String text) {
    final styleButton = TextStyle(
      fontSize: 20,
      color: kPrimaryColor,
      fontWeight: FontWeight.bold
    );

    return ReadMoreText(
      text, 
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: "Read More",
      trimExpandedText: "Read Less",
      lessStyle: styleButton ,
      moreStyle: styleButton,
      style: const TextStyle( fontSize: 20),
    );
  }

}

