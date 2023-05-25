import 'package:get/get.dart';

import 'all_users_service.dart';


class AllUsersController extends GetxController{

  var userlist=[];
  var isloading=true.obs;


  AllUsersService service = AllUsersService();

  @override
  void onInit() async {
    print("init");
    userlist=await service.GetUsers();
    isloading(false);
    print("end");
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