import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/constants.dart';
//import 'package:meal_app_salloum/Modules/Counter/counter_controller.dart';
import 'package:monfy_app/video_page/video_controller.dart';

class VideoPage extends StatelessWidget {
  VideoController controller =VideoController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Video Player",style: TextStyle
          (color: Colors.white),),
      ),
      body: Column(
        children: [
          GetBuilder<VideoController>(
              init: VideoController(),
              builder: (controller)=>Expanded(child: Center(
                  child: controller.chewieController!=null &&
                      controller.chewieController!.videoPlayerController.value.isInitialized?
                  Chewie(

                    controller: controller.chewieController!,
                  ):
                  Container(
                    color: Colors.black87,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Loading...",style: TextStyle(color: Colors.white),),

                      ],
                    ),
                  )
              )
              )
          )
        ],
      ),
    );
  }
}
