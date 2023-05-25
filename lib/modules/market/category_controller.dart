import 'package:get/get.dart';
import 'package:monfy_app/modules/market/market_service.dart';

class CartegoryController extends GetxController{
  var search="all" ;
  var data=Get.arguments;
  var id;
  var name;
  var Product = [];
  var isloading = true.obs;
  var Country;
MarketService service = MarketService();
  @override
  Future <void> onInit() async{

    isloading(true);
    print("Hello");
    id=data['id'];
    Country=data['country'];
    print(Country);
    name=data['name'];
     Product = await  service.GetProductsByCat(id);
    isloading(false);
    super.onInit();
  }

  Future<void> onSearch()async{
    isloading(true);
    await  service.GetProductsByCat(id);
    isloading(false);
  }
}