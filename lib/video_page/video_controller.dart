import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/constants.dart';
import 'dart:io';
import 'package:monfy_app/config/server_config.dart';
import 'package:video_player/video_player.dart';
class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
   var link;

  @override
  void onInit() {
    link=Get.arguments;
    print(link)
;    super.onInit();
    initializePlayer();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  Future<void> initializePlayer() async{

    videoPlayerController=VideoPlayerController.network("${Uri.parse(ServerConfig.DNS + "/posts/" + link)}");
    await Future.wait([videoPlayerController.initialize()]);
    chewieController=ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: kPrimaryColor,
        handleColor: Colors.purple,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightBlueAccent,
      ),
      placeholder: Container(
        color: Colors.black87,
      ),
      autoInitialize: true,
    );
    update();
  }
}