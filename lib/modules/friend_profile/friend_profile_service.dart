import 'dart:convert';
import 'dart:io';

import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/models/suggest_user.dart';



class FriendProfileService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.MyProfile);
  var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.MyProfile);

  Future<SuggestUser>GetUserProfile(int id) async {
    print("I am USERRRR");
    print(id);
    var response = await http.get(
        Uri.parse(ServerConfig.DNS +ServerConfig.ShowUserProfile+"${id}"),
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDJlYzg4N2M4YzM1NDA4ZDY5ODA1ZmEyMDA3NzczNTU3MWY2ZDU0N2Q1MDFhYTIxYzJjMjM3YzQwY2Q3ODJhZWE0OGU0N2JkOGZhZWNmMzgiLCJpYXQiOjE2NTk5NzM3MDcuNTUzMTIzLCJuYmYiOjE2NTk5NzM3MDcuNTUzMTI3LCJleHAiOjE2OTE1MDk3MDcuNDUxNzI5LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.F6g8OIVrKf83zzANCm4n3I5j61lg9pmZzFGXWBX3PVApXTKdWbCeWHAQmOoRI-9UHMjUj0UfGEfJn2mpvKpoHt-AmEZRqcNyi8QHk9MPOlhv-KD3PfjqyDyqtoGEYLWFjHQsgQL9VME1kPgPLnpiQJ-BUPkg93JQ4siIloY4SuBRdVoyPYthe9uamqdydKHVTb2h8GgPpCoP8tbN6RD5-gniYvWiK4Mz5gZmrCYrLDfjQXCGpbbTIX2yt_hLMIxGXVSVorG5vFNuWmcG2G8-8x342IObfp7ypQaiRT64lkmnSdZwdkjMVfAwC9Rv1k0Rw9PIJiRAH5-kVeDR2qkiSZHuPgg9qfu6Ovbw6VIRk7OEAP4kZT1MWREKUGO5oiD1QFgKzgWbFtiGVpfcDPuQhIH1bNTLIPCk8VmgIzAfjkw_6WerA7i9E3xYYYuakt9Jdtm-9O8ThXGlxKLzH4iH_m9aBigXXrhcz0DT9TeHlgBnMqvVIRja43E-1ZDGguGRiJwcLwcgebCeL12OhUqcBjRb6UtOX3lDL4qfzNON4BntY_yD_mr977r4aGC7c_zl42KT-2-MCLb4Yzn5-J383D_T7IyLcVfd1M1cQ2QfgOvLojg5SEgxiv8kofdZ__MqdvG-g1Tn-xJC5VYUnKe2qRiWpCFCaLlnYG5XBcxKBuk'


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
  Future<bool>MakeLike(int id) async{
    var response = await http.post(
      Uri.parse(ServerConfig.DNS +ServerConfig.MakeLike+"${id}"),
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOTZjYWFjYmQ2OGRjN2NkNzgzOTVkYTE3NTAwZTAzNjliZDBlYzBhNzIwNDRiZDA4MTk1MTQwODIwZTlhMGVmY2M5MTcyMTIzNzAxZWYzNzkiLCJpYXQiOjE2NTc1Mzk5MjUuMjQ2NDU1LCJuYmYiOjE2NTc1Mzk5MjUuMjQ2NDYzLCJleHAiOjE2ODkwNzU5MjQuODQ2MTg1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.sBDwFKj61SdyPlW0j3Fw8JigaczTZHmv1-rWzFOeoWnIGCpzmR1hGacvSgsOPoz4UtXRAfp_zVHXtD3xDxWz4eLmZaHspyxrdVpI7e-DJQLhsOtKJ3sPmwedgtlDB3jeDOMLwFAjU14GsSKJZheLhzzTDEffqTCWDDsgzj6zRuUX5JvuUHX0031VyEEjNXzBsAEKFDk0olMQrD7sdIqsKc-VC9Lp_choz1A48FeGeAKDD96cUWAPRXvX2OuDkRQUfB7vTba8cBO0e5hNU4yzVG3vS999FyFlpNjnz2GwUIggJWnPYIvRJln-D1ayCGqZEasFuvYOIUwWzd-HnF9TxTnnsUZ8VHTJFeit6XTR0rPkDk73gQ2iTYwc6HfZdK7-BXghmmOtkLDgMUDhB465OOw0kjEJKP3yLMOi1ehuA3h4Yns4CwsiuVc_WnEvBywhMDTs3F2R99ifSOI_WxljHuk3FaQzamvLElUxWUQkd6qWaHF03OcUdJ0Tazhs9Y-RD8XSnlmWVSsCn4FctYXt7EEFl9Bef7F2hyitUGZLzkttly2UyqA73P_f4Hg2FpkRhC3x9F8gx0HHlzSMghKyowD9dlJ44iVvFWhF5lv-lQ-VYeuw3bVDs11cCu6IPVcvz703dGEl2HhogssAEfNFHGBVftwi4lxy5ofziPUHUEk'

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



