import 'package:get/get.dart';
import 'package:monfy_app/modules/home/home_service.dart';

class HomeController extends GetxController{
  var postlist=[];
  var makelike;
  var islike =false.obs;
  var isloading=true.obs;



  HomeService service = HomeService();

  @override
  Future<void> onInit() async {
    isloading(true);
     await fetchh();
    super.onInit();
    isloading(false);
  }
  @override
  void onReady() async{

    super.onReady();
  }
  Future<void> makeLike(int id) async {
       makelike = await service.MakeLike(id);
  }
  Future<void> fetchh()
  async{

    postlist=await service.GetAllPosts();

    print("end");
   // Get.offNamed('/');
   update();

  }
  Future<void> fetchw()
  async{
    postlist=await service.GetAllPosts();
    print("end");
   // Get.offNamed('/');
     update();
  }
}