import 'package:get/get.dart';
import 'package:monfy_app/models/suggest_user.dart';
import 'package:monfy_app/modules/requester_profile/service1.dart';



class RequesterProfileController extends GetxController{
  var id;
  var Zr = "Add Friend".obs;

  RequesterProfileService service2 = RequesterProfileService();

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
  var friends;
  var name;
  var lastname;
  var gender;
  var birthdate;
  var personalimage;
  var coverimage;
  var personalimagename;
  var coverimagename;
  var path;
  var job;
  var study;

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
   await fetchh();
    super.onReady();
  }
  Future<void> AcceptFriendRequest()
  async{
    SendRequestStatuse = await service2.AcceptFreind(id);
  }

  Future<void> DenyFriendRequest()
  async{
    SendRequestStatuse = await service2.DenyFreind(id);
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
    job=me!.user!.job;
    study=me!.user!.study;
    birthdate=me!.user!.birthdate;
    personalimagename=me!.user!.profilePhoto;
    coverimagename=me!.user!.coverPhoto;
    path=me!.user!.path;
    posts=me!.posts!;
    friends=me!.friends;

    //coverimage=me!.coverPhoto;
    isloading(false);
  }
}