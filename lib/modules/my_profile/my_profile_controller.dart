import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monfy_app/config/user_info.dart';
import 'package:monfy_app/models/my_profile.dart';
import 'package:monfy_app/modules/my_profile/my_profile_service.dart';
import 'package:monfy_app/native_services/secure_storage.dart';



 class MyProfileController extends GetxController{
  MyProfileService service = MyProfileService();
  MyProfile? me;
  var name;
  var lastname;
  var gender;
  var birthdate;
  var posts=[];
  var freinds=[];
  var job;
  var email;
  var study;
  var isloading=true.obs;
  String? coverbase64;
  String? personbase64;
  //////////////////////////////////////////////////
  static const double pImageHeightClosed = 520;
  var pIH = pImageHeightClosed;
  var position;
  var panelHeightClosed ;
  var panelHeightOpen;
  var isProficPicPathSet=false.obs;
  var profilePicPath="".obs;
  //////////////////////////////////////////
  final picker = ImagePicker();
  var personalimage;
  var coverimage;
  ////////////////////////////////////////
  var personalimagename;
  var coverimagename;
  var path;
  ///////////////////////////////////////////
  Future getCoverImage(ImageSource src) async{
    final imagepick = await picker.getImage(source: src);

    if(imagepick != null)
    {
      coverimage = File (imagepick.path);
        await service.AddCoverImage(coverimage);
      // coverbase64= base64Encode(coverimage.readAsBytesSync());
      //String imagename = coverimage.path.split("/").last;
    }
    else{
      print("No Image Selected");
    }
    update();
  }
  Future getPersonalImage(ImageSource src) async{
    final imagepick = await picker.getImage(source: src);

    if(imagepick != null)
    {
      personalimage = File (imagepick.path);
      await service.AddPersonalImage(personalimage);
      print("Ended");
    }
    else{
      print("No Image Selected");
    }
    update();
  }
  ///////////////////////////////////////////
  void personalImageMove(){
    final panelMaxScrollExtent = panelHeightOpen - panelHeightClosed;
    pIH=position * panelMaxScrollExtent+pImageHeightClosed;
    update();
  }
  void setProfileImagePath(String path){
    profilePicPath.value=path;
    isProficPicPathSet=true.obs;
  }
  ////////////////////////////////////////////
  @override
  void onInit() async{
    print("on init");
     fetchh();
   // Get.close(1);
   // Get.delete<MyProfileController>();
    //me = await service.GetMyProfile();
    super.onInit();
  }
  @override
  void onReady() async{

    super.onReady();
  }
  Future <void> fetchh()
  async{
    me = await service.GetmyProfile();
    name=me!.user.name;
    lastname=me!.user.lastname;
    gender=me!.user.gender;
    job=me!.user.job;
    study=me!.user.study;
    email=me!.user.email;
    birthdate=me!.user.birthdate;
    personalimagename=me!.user.profilePhoto;
    coverimagename=me!.user.coverPhoto;
    path=me!.user.path;
    UserInfo.imageprofilename=me!.user.profilePhoto;
    SecureStorage storage = SecureStorage();
    await storage.save('image', UserInfo.imageprofilename);
    UserInfo.path=me!.user.path;
    posts=me!.posts;
    freinds=me!.friends;
    await storage.save('path', UserInfo.path);
    //coverimage=me!.coverPhoto;
    isloading(false);
  }
  Future<void> makeLike(int id) async {
    await service.MakeLike(id);
  }
  Future<void> DeletePost(int id) async {
    await service.DeletePost(id);
  }
}