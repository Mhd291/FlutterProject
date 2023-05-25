import 'dart:convert';

import 'package:monfy_app/config/server_config.dart';
import 'package:monfy_app/config/user_info.dart';
import 'package:monfy_app/models/my_user.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/native_services/secure_storage.dart';

class LogService{
  var url = Uri.parse(ServerConfig.DNS+ServerConfig.register);
  var url1 = Uri.parse(ServerConfig.DNS+ServerConfig.login);
  var message;
  var error;
  var token;


  Future<bool> register(User user)
  async{

    var response = await http.post(
      url,
      headers: {
        'Accept':'application/json',
      },
      body: {
        'name':user.Name,
        'lastname':user.LastName,
        'email': user.Email,
        'password': user.Password,
        'confirm':user.ConfirmPassword,

      },
    );
    print(url);
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
      message=jsonResponse['success'];
      return true;
    }
    else if(response.statusCode==422){
      var jsonResponse=jsonDecode(response.body);
      message= jsonResponse['errors'];
      return false;
    }
    else{
      var jsonResponse=jsonDecode(response.body);
      message= jsonResponse['errors'];
      return false;
    }
  }
  Future<bool>login(User user,bool check)async{
    var response = await http.post(url1,

        body: {
          'email':user.Email,
          'password':user.Password
        }

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200)
    {   var jsonResponse =  jsonDecode(response.body);
    error=jsonResponse['error'];
    token=jsonResponse['token'];

    UserInfo.usertoken=token;

    if(check==true)
    {
      SecureStorage storage = SecureStorage();
      await storage.save('token', UserInfo.usertoken);

    }

    return true;

    }

    else if(response.statusCode==422){
      var jsonResponse=jsonDecode(response.body);
      error=  jsonResponse['error'];
      return false;
    }
    else{
      var jsonResponse=jsonDecode(response.body);
      error=  jsonResponse['error'];
      return false;
    }
  }

}