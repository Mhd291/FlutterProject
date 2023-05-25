import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:monfy_app/models/my_user.dart';

import 'package:monfy_app/modules/log_in/log_service.dart';

LogService service = LogService();

class LogInController extends GetxController{
  var keep =false ;
  var Email;
  var Password;
  var LoginStatuse=false;
  var message;




  Future<void>LogOnClick()async{
    User user = User(Email: Email,Password: Password);

    LoginStatuse =await service.login(user,keep);
    message = service.error;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }














  //
  // void changekeep(bool k){
  //   keep((!keep));
  // }
}