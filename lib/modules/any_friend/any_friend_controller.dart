import 'package:get/get.dart';




class AnyFreindController extends GetxController{
  var data;
  var userlist=[];
  var isloading=true.obs;



  @override
  void onInit() async {
    print("init");
    data=await Get.arguments;
    userlist= data['array'];
    print(userlist);
    isloading(false);
    print("end");
    super.onInit();
  }
  @override
  void onReady() async{
    print(userlist);
    userlist=await Get.arguments;
    isloading(false);
    print("end");
    super.onReady();
  }


}