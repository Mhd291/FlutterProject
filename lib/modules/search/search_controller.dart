import 'package:get/get.dart';
import 'package:monfy_app/modules/search/search_service.dart';




class SearchController extends GetxController{

  var userlist=[];
  var isloading=false.obs;
  var isSearch = false.obs;
  var search="all" ;


  SearchService service = SearchService();

  @override
  void onInit() async {

    super.onInit();
  }
  @override
  void onReady() async{

    super.onReady();
  }

  Future<void>Search()
  async{
    isloading(true);
    isSearch(true);
    userlist=await service.Search();
    isSearch(false);
  }


}