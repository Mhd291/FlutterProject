import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:monfy_app/modules/add_product/add_product_service.dart';
import 'package:monfy_app/modules/add_product/category_list.dart';

class AddProductController extends GetxController{

  AddProductService service = AddProductService();
  var price;
  var desc;
  var name;
  var region;
  var addpostStatus = false;



  var UserName="hadi";
  var UserLastName="Moussa";
  var userImage;
  /////////////////////////////////////////////////
  var productNameController=TextEditingController() ;
  var priceController=TextEditingController() ;
  var textDetailsController=TextEditingController() ;
  /////////////////////////////
  var currentItem=Categories.Clothes;
  void ChangeCategory(var item){
    currentItem=item;
    update();
  }
  ////////////////////////////
  final picker = ImagePicker();
  var productImage;
  var isPicPathSet=false.obs;
  var PicPath="".obs;
  Future getImage(ImageSource src) async{
    final imagepick = await picker.getImage(source: src);

    if(imagepick != null)
    {
      productImage = File (imagepick.path);
    }
    else{
      print("No Image Selected");
    }
    update();
  }
  void DeleteImage(){
    productImage=null;
    update();
  }
  Future<void> AddProduct()
  async{
    addpostStatus = await service.AddProduct(currentItem.id, price, productImage, name, desc, region);
  }
}