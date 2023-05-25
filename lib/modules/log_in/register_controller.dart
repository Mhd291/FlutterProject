import 'package:get/get.dart';
import 'package:monfy_app/models/my_user.dart';
import 'package:monfy_app/modules/log_in/log_service.dart';

class RegisterController extends GetxController{
  var Name='';
  var LastName='';
  var Email='';
  var Password='';
  var ConfirmPassword='';

  var SignupStatuse =false;
  var message;


  LogService service = LogService();
  Future<void> RegisterOnClick() async {
    User user = User(Name: Name,LastName: LastName,Email: Email,Password: Password,ConfirmPassword: ConfirmPassword);

    SignupStatuse= await service.register(user);
    message = service.message;

    if(message is List){
      String t ="";
      for(String b in message) t+=b + '\n';
      message=t;
    }
  }
}