import 'package:get/get.dart';
//import 'package:monfy_app/modules/user_profile/user_profile_controller.dart';
import 'package:monfy_app/video_page/video_controller.dart';



class VideoBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<VideoController>(()=>VideoController());
  }


}