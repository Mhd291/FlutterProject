import 'package:get/get.dart';
import 'package:monfy_app/models/suggest_user.dart';
import 'package:monfy_app/modules/user_profile/user_profiile_screen.dart';
import 'package:monfy_app/modules/user_profile/user_profile_service.dart';




class UserProfileController extends GetxController{
  var id;
  var Zr = "Add Friend".obs;
  var job;
  var study;

  UserProfileService service2 = UserProfileService();

  static const double pImageHeightClosed = 600 ;
  var pIH = pImageHeightClosed;
  var position;
  var panelHeightClosed ;
  var panelHeightOpen;
  var posts=[];
  var isProficPicPathSet=false.obs;
  var profilePicPath="".obs;
  var isloading=true.obs;
  var SendRequestStatuse =false;
 
  //////////////////////////////////////////
  SuggestUser? me;
  var friends=[];
  var name;
  var lastname;
  var gender;
  var birthdate;
  var personalimage;
  var coverimage;
  var personalimagename;
  var coverimagename;
  var path;
 
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
  Future<void> onClickUser()
  async {
     Zr = "Requested".obs;
     update();
  }
  @override
  Future<void> onInit() async{
    id=Get.arguments;
    super.onInit();
  }
  @override
  void onReady() async{
   fetchh();
    super.onReady();
  }
  Future<void> SendFriendRequest()
  async{
    SendRequestStatuse = await service2.SendFriendRequest(id);
  }
  Future<void> makeLike(int id) async {
    await service2.MakeLike(id);
  }
  Future<void>fetchh()
  async{
    me = await service2.GetUserProfile(id);
    name=me!.user!.name;
    lastname=me!.user!.lastname;
    gender=me!.user!.gender;
    birthdate=me!.user!.birthdate;
    personalimagename=me!.user!.profilePhoto;
    coverimagename=me!.user!.coverPhoto;
    job=me!.user!.job;
    study=me!.user!.study;
    path=me!.user!.path;
    posts=me!.posts!;
    friends=me!.friends!;
    //coverimage=me!.coverPhoto;
    isloading(false);
  }
}