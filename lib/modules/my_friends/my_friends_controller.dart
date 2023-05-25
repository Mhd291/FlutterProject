import 'package:get/get.dart';
import 'package:monfy_app/modules/my_friends/my_freinds_service.dart';




class MyFriendsController extends GetxController{

  var userlist=[];
  var isloading=true.obs;


  MyFreindsService service = MyFreindsService();

  @override
  void onInit() async {
    //await service.GetUsers();
    super.onInit();
  }
  @override
  void onReady() async{
    userlist=await service.GetUsers();
    isloading(false);
    print("end");
    super.onReady();
  }


}