import 'package:get/get.dart';

import 'freind_service.dart';




class FriendRequestController extends GetxController{

  var requestslist=[];
  var acceptStatues=false;
  var denyStatues=false;
  var isloading=true.obs;


  FreindRequestService service = FreindRequestService();

  @override
  void onInit() async {
    print("ther are a request00");
    requestslist=await service.GetRequests();
    isloading(false);
    print("end");
    super.onInit();
  }
  @override
  void onReady() async{

    super.onReady();
  }
  Future<void> Accept(int id)
  async{
    print("controller will accept");
    acceptStatues=await service.AcceptFreind(id);
  }

  Future<void> Deny(int id)
  async{
    print("controller will deny");
    denyStatues=await service.DenyFreind(id);
  }


}