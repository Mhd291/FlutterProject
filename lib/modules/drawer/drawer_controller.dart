import 'package:get/get.dart';
import 'menupage.dart';

class DrawerController1 extends GetxController{
  var currentItem =MenuItems.home;

  void ChangeItem(var item){
    currentItem=item;
    update();
  }
}


