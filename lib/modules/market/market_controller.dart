import 'package:get/get.dart';
import 'package:monfy_app/modules/market/market_service.dart';

class MarketController extends GetxController{
MarketService service = MarketService();
var Category = [];
var Product = [];
var isloading = true.obs;
var Countryy="all".obs;


  Future<void>GetMarket()
  async{
    isloading(true);
    Category = await service.GetCategories();
    Product = await service.GetProducts();
    isloading(false);
   // isloadingComments(false);


  }
  @override
  void onInit() {
    GetMarket();
    super.onInit();
  }
}
