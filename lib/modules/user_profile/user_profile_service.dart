import 'dart:convert';
import 'dart:io';

import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/models/suggest_user.dart';



class UserProfileService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.MyProfile);
  var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.MyProfile);

  Future<SuggestUser>GetUserProfile(int id) async {
    print("I am USERRRR");
    print(id);
    var response = await http.get(
        Uri.parse(ServerConfig.DNS +ServerConfig.ShowUserProfile+"${id}"),
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWEwODE1OWNmNDAzYjYyNzVjMzQ4MTlmMjM0YmRjMzc4OTQ5Mjg5MDhlYTg4MzFmZmY3M2IxNmRjMWUwYjY5YzIwNTJmNjhjOGM2YzJmMzkiLCJpYXQiOjE2NTk5NzM2NDQuNDg0MjE2LCJuYmYiOjE2NTk5NzM2NDQuNDg0MjE5LCJleHAiOjE2OTE1MDk2NDQuMjQzOTg3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.ZQ8HY3lrU_5gV_jQ35pOuOU8AMtsNFnu2pnfz29kbx6zXGc1wGgPyIjcwDuYd4oSceAibYy_hrAJuIYhnnWm0TaJe46jfgLXpbV9T8AnIW6p15p2RGM7RUGfj-cyDI98VAN5vT4cSVWH7z1umSFtkEUwa1V2qUrOoy2mWoSoZ2caVD_1Y-7nMrIVYQs7MpF24BT1kIot31-0cN53iRyLQE8Pg3s3bqM7v3IYFaahBCMDJyFiwlKltZFEyummsQ9KH0kszZh9FE6TjQuE6XLgLnqrbmZVCFTKtSMkWra2V2a-RRa5a6371hSccVl8FB80lpzd3ftWTVAHGkSNGaMyYdLJAigZhplc_b8Nl1oeSsVvXfGMNGVKFNxWKNCr2jrKsPUZowQNJgDMDu5xrhqlW99Lg2CWt6VBvRzlF9Gah8uyt_FnuGj3BnGHmgtzY3l-ZXi4god_P8PRgwBiQW9hC5jXpAqsGg25903ILYmYDo33a8BzCozd8j8wb4Q8uEgqtKMBQfCVkhYzViGPtg5CIhteF_-i5qUx8-I-L8VaqwQNozOVipgAje52A7Cv5Vv3QS11VTUrJwq2eXGDdeJmnRceNSd3k8Qau7pqp44yKL8GXSpnjsBvGMt7ovDAm0TfMY6o6KLbE6lttMV1yyaTjFKfd36M5AGnlUm6BkI6UKM'


        });
    if(response.statusCode==200)
    {
      var MyProfileResponse = suggestUserFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      //print(MyProfileResponse.user);
      return MyProfileResponse;

    }
    else return SuggestUser(user: User(id: 0, name: "name", lastname: "lastname", profilePhoto: "profilePhoto", coverPhoto: "coverPhoto", path: "path"), friends: [], posts: []);
  }
  Future<bool>SendFriendRequest(int id) async{
    var response = await http.post(
      Uri.parse(ServerConfig.DNS +ServerConfig.SendFriendRequest+"${id}"),
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWEwODE1OWNmNDAzYjYyNzVjMzQ4MTlmMjM0YmRjMzc4OTQ5Mjg5MDhlYTg4MzFmZmY3M2IxNmRjMWUwYjY5YzIwNTJmNjhjOGM2YzJmMzkiLCJpYXQiOjE2NTk5NzM2NDQuNDg0MjE2LCJuYmYiOjE2NTk5NzM2NDQuNDg0MjE5LCJleHAiOjE2OTE1MDk2NDQuMjQzOTg3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.ZQ8HY3lrU_5gV_jQ35pOuOU8AMtsNFnu2pnfz29kbx6zXGc1wGgPyIjcwDuYd4oSceAibYy_hrAJuIYhnnWm0TaJe46jfgLXpbV9T8AnIW6p15p2RGM7RUGfj-cyDI98VAN5vT4cSVWH7z1umSFtkEUwa1V2qUrOoy2mWoSoZ2caVD_1Y-7nMrIVYQs7MpF24BT1kIot31-0cN53iRyLQE8Pg3s3bqM7v3IYFaahBCMDJyFiwlKltZFEyummsQ9KH0kszZh9FE6TjQuE6XLgLnqrbmZVCFTKtSMkWra2V2a-RRa5a6371hSccVl8FB80lpzd3ftWTVAHGkSNGaMyYdLJAigZhplc_b8Nl1oeSsVvXfGMNGVKFNxWKNCr2jrKsPUZowQNJgDMDu5xrhqlW99Lg2CWt6VBvRzlF9Gah8uyt_FnuGj3BnGHmgtzY3l-ZXi4god_P8PRgwBiQW9hC5jXpAqsGg25903ILYmYDo33a8BzCozd8j8wb4Q8uEgqtKMBQfCVkhYzViGPtg5CIhteF_-i5qUx8-I-L8VaqwQNozOVipgAje52A7Cv5Vv3QS11VTUrJwq2eXGDdeJmnRceNSd3k8Qau7pqp44yKL8GXSpnjsBvGMt7ovDAm0TfMY6o6KLbE6lttMV1yyaTjFKfd36M5AGnlUm6BkI6UKM'

      },
    );
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
      print("Send Request Successfully");
      return true;
    }
    else if(response.statusCode==422){
      var jsonResponse=jsonDecode(response.body);
      print("UnSend Request");
      return false;
    }
    else{
      var jsonResponse=jsonDecode(response.body);
      print("UnSend Request");
      return false;
    }
  }
  Future<bool>MakeLike(int id) async{
    var response = await http.post(
      Uri.parse(ServerConfig.DNS +ServerConfig.MakeLike+"${id}"),
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWEwODE1OWNmNDAzYjYyNzVjMzQ4MTlmMjM0YmRjMzc4OTQ5Mjg5MDhlYTg4MzFmZmY3M2IxNmRjMWUwYjY5YzIwNTJmNjhjOGM2YzJmMzkiLCJpYXQiOjE2NTk5NzM2NDQuNDg0MjE2LCJuYmYiOjE2NTk5NzM2NDQuNDg0MjE5LCJleHAiOjE2OTE1MDk2NDQuMjQzOTg3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.ZQ8HY3lrU_5gV_jQ35pOuOU8AMtsNFnu2pnfz29kbx6zXGc1wGgPyIjcwDuYd4oSceAibYy_hrAJuIYhnnWm0TaJe46jfgLXpbV9T8AnIW6p15p2RGM7RUGfj-cyDI98VAN5vT4cSVWH7z1umSFtkEUwa1V2qUrOoy2mWoSoZ2caVD_1Y-7nMrIVYQs7MpF24BT1kIot31-0cN53iRyLQE8Pg3s3bqM7v3IYFaahBCMDJyFiwlKltZFEyummsQ9KH0kszZh9FE6TjQuE6XLgLnqrbmZVCFTKtSMkWra2V2a-RRa5a6371hSccVl8FB80lpzd3ftWTVAHGkSNGaMyYdLJAigZhplc_b8Nl1oeSsVvXfGMNGVKFNxWKNCr2jrKsPUZowQNJgDMDu5xrhqlW99Lg2CWt6VBvRzlF9Gah8uyt_FnuGj3BnGHmgtzY3l-ZXi4god_P8PRgwBiQW9hC5jXpAqsGg25903ILYmYDo33a8BzCozd8j8wb4Q8uEgqtKMBQfCVkhYzViGPtg5CIhteF_-i5qUx8-I-L8VaqwQNozOVipgAje52A7Cv5Vv3QS11VTUrJwq2eXGDdeJmnRceNSd3k8Qau7pqp44yKL8GXSpnjsBvGMt7ovDAm0TfMY6o6KLbE6lttMV1yyaTjFKfd36M5AGnlUm6BkI6UKM'

      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==201){
      return true;
    }
    if(response.statusCode==200){

      return false;
    }

    else{
      return false;
    }
  }

}



