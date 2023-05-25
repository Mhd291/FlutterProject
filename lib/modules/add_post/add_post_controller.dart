import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monfy_app/modules/add_post/add_post_service.dart';

class AddPostController extends GetxController{

  AddPostService service = AddPostService();

  var UserName="hadi";
  var UserLastName="Moussa";
  var userImage;
  String? str;
  var textPostController=TextEditingController() ;
  final picker = ImagePicker();
  File? image;
  File? video;
  var imagepick;
  var isPicPathSet=false.obs;
  var PicPath="".obs;
  bool? addpostStatus;
  Future getVideo() async{
    var Videopick = await picker.getVideo(source: ImageSource.gallery);

    if(Videopick != null)
    {
      video = File (Videopick.path);
      Get.toNamed('/add_post');
    }
    else{
      print("No Video Selected");
      Get.toNamed('/add_post');
    }
    update();
  }
  Future getImage(ImageSource src) async{
     imagepick = await picker.getImage(source: src);

    if(imagepick != null)
    {
      image = File (imagepick.path);
      Get.toNamed('/add_post');
    }
    else{
      print("No Image Selected");
      Get.toNamed('/add_post');
    }
    update();
  }
  void DeleteImage(){
    image=null;
    update();
  }
  Future<void>AddPost(File f)
  async{
    addpostStatus= await service.AddPost(f,str!);
  }
  Future<void>AddPost2()
  async{
    addpostStatus= await service.AddPost2(str!);
  }
}