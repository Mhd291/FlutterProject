import 'dart:io';

import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/models/my_profile.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';


class MyProfileService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.MyProfile);
  var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddCoverImage);

  Future<MyProfile>GetmyProfile() async {
    print("I am here");
    var response = await http.get(
        url,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjdhOTk4OTY5YWYzYzY3ZWQ3ZmNjNjkyZjRjOTBhOGRlMDc0ZThhOWYxNzFiOGQ4ZGJkOTk2ZDk2ZGIzMzFmODg1OTMwYjM3ZjQ0MzUxZjgiLCJpYXQiOjE2NjAwMDAxMjAuNzU1MTI3LCJuYmYiOjE2NjAwMDAxMjAuNzU1MTMsImV4cCI6MTY5MTUzNjEyMC42Mjc3NTYsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.JiNIlmVezROI9z_seBIF2F_4ko6O05E4pP57T0DY6sMFPBfq4enyRgDuqQ-8h7SRkxX0gBP-xro8wAi5kxXZEZPKbv9I7eiRgmcV21s8QThD0QbCFuUyRMUPfF03BbRGrQxJX94mVOTjoBp1dKhJdmvm2TMdikn7IXDMAkm7ejpMYvcVlGDB6zXWlGz3nGuhEfqTAIgMieWlo1QdGyf4GDtibFvZ1mmCj-aEp6TuDQ6TOthG7ACvCFLNBfwx0EqXKwld5UwFmiS3sHmWingHvQTRzxzHHNpBktM3ZwJ6AP6W6qcJ4nSTXYiTXJBPeVJmKwSMW2SZNnPHGC3WHrtYjAuYU7EiYlHNk8XNeiDJhrlXxRehzpYs61rEYZYBiCOU17QBHlcho_EosQfYFXINti2PExWOWDDeWnf50NlhX3JIcaSE9ADH5cZqvDnMC9L7C0S95zPoeRHLjRr0BbF_rtd501k3jWwLAyPQqJyhf3p3pD0lXRl8HKxPli5UgL19yKd0GQpULdOrvDpiID9dTVGfhucyZ7fE6m2ajUR7VGGQbGnMCvhGJU_kRU_C5l-ztthi2raLjchONluhHGa75K-vpQPJ72lwUPu7e55xNU2hhfsPaaqAsoPIApmcRnGJb0xMmlHoz3HV2HdhznCWL8_Tj-IGdekGcHLt1oY0pFM'

        });
    if(response.statusCode==200)
    {
      var MyProfileResponse = myProfileFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      //print(MyProfileResponse.user);
      return MyProfileResponse;

    }
    else return MyProfile(user: User(id: 0, name: "name", lastname: "lastname", profilePhoto: "profilePhoto", coverPhoto: "coverPhoto", path: "path"), friends: [], posts: []);

  }

  Future<void>AddCoverImage(File f)async {
    print("Hello files");
    var stream = new http.ByteStream(DelegatingStream.typed(f.openRead()));
    var length =await f.length();
    var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddCoverImage);
    var request = new http.MultipartRequest("POST", url1);
    request.headers.addAll({ 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDJlYzg4N2M4YzM1NDA4ZDY5ODA1ZmEyMDA3NzczNTU3MWY2ZDU0N2Q1MDFhYTIxYzJjMjM3YzQwY2Q3ODJhZWE0OGU0N2JkOGZhZWNmMzgiLCJpYXQiOjE2NTk5NzM3MDcuNTUzMTIzLCJuYmYiOjE2NTk5NzM3MDcuNTUzMTI3LCJleHAiOjE2OTE1MDk3MDcuNDUxNzI5LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.F6g8OIVrKf83zzANCm4n3I5j61lg9pmZzFGXWBX3PVApXTKdWbCeWHAQmOoRI-9UHMjUj0UfGEfJn2mpvKpoHt-AmEZRqcNyi8QHk9MPOlhv-KD3PfjqyDyqtoGEYLWFjHQsgQL9VME1kPgPLnpiQJ-BUPkg93JQ4siIloY4SuBRdVoyPYthe9uamqdydKHVTb2h8GgPpCoP8tbN6RD5-gniYvWiK4Mz5gZmrCYrLDfjQXCGpbbTIX2yt_hLMIxGXVSVorG5vFNuWmcG2G8-8x342IObfp7ypQaiRT64lkmnSdZwdkjMVfAwC9Rv1k0Rw9PIJiRAH5-kVeDR2qkiSZHuPgg9qfu6Ovbw6VIRk7OEAP4kZT1MWREKUGO5oiD1QFgKzgWbFtiGVpfcDPuQhIH1bNTLIPCk8VmgIzAfjkw_6WerA7i9E3xYYYuakt9Jdtm-9O8ThXGlxKLzH4iH_m9aBigXXrhcz0DT9TeHlgBnMqvVIRja43E-1ZDGguGRiJwcLwcgebCeL12OhUqcBjRb6UtOX3lDL4qfzNON4BntY_yD_mr977r4aGC7c_zl42KT-2-MCLb4Yzn5-J383D_T7IyLcVfd1M1cQ2QfgOvLojg5SEgxiv8kofdZ__MqdvG-g1Tn-xJC5VYUnKe2qRiWpCFCaLlnYG5XBcxKBuk'
    });

    var multipartFile = new http.MultipartFile("cover", stream, length,filename: basename(f.path));


    request.files.add(multipartFile);

    var response = await request.send();
    if(response.statusCode==200)
      {
        print("Image Uploaded");
      }
    else{
      print(response);
      print("Uploaded failed");
    }
  }
  Future<void>AddPersonalImage(File f)async {
    print("Hello files");
    var stream = new http.ByteStream(DelegatingStream.typed(f.openRead()));
    var length =await f.length();
    var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddPersonalImage);
    var request = new http.MultipartRequest("POST", url1);
    request.headers.addAll({ 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDJlYzg4N2M4YzM1NDA4ZDY5ODA1ZmEyMDA3NzczNTU3MWY2ZDU0N2Q1MDFhYTIxYzJjMjM3YzQwY2Q3ODJhZWE0OGU0N2JkOGZhZWNmMzgiLCJpYXQiOjE2NTk5NzM3MDcuNTUzMTIzLCJuYmYiOjE2NTk5NzM3MDcuNTUzMTI3LCJleHAiOjE2OTE1MDk3MDcuNDUxNzI5LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.F6g8OIVrKf83zzANCm4n3I5j61lg9pmZzFGXWBX3PVApXTKdWbCeWHAQmOoRI-9UHMjUj0UfGEfJn2mpvKpoHt-AmEZRqcNyi8QHk9MPOlhv-KD3PfjqyDyqtoGEYLWFjHQsgQL9VME1kPgPLnpiQJ-BUPkg93JQ4siIloY4SuBRdVoyPYthe9uamqdydKHVTb2h8GgPpCoP8tbN6RD5-gniYvWiK4Mz5gZmrCYrLDfjQXCGpbbTIX2yt_hLMIxGXVSVorG5vFNuWmcG2G8-8x342IObfp7ypQaiRT64lkmnSdZwdkjMVfAwC9Rv1k0Rw9PIJiRAH5-kVeDR2qkiSZHuPgg9qfu6Ovbw6VIRk7OEAP4kZT1MWREKUGO5oiD1QFgKzgWbFtiGVpfcDPuQhIH1bNTLIPCk8VmgIzAfjkw_6WerA7i9E3xYYYuakt9Jdtm-9O8ThXGlxKLzH4iH_m9aBigXXrhcz0DT9TeHlgBnMqvVIRja43E-1ZDGguGRiJwcLwcgebCeL12OhUqcBjRb6UtOX3lDL4qfzNON4BntY_yD_mr977r4aGC7c_zl42KT-2-MCLb4Yzn5-J383D_T7IyLcVfd1M1cQ2QfgOvLojg5SEgxiv8kofdZ__MqdvG-g1Tn-xJC5VYUnKe2qRiWpCFCaLlnYG5XBcxKBuk'
    });

    var multipartFile = new http.MultipartFile("profile", stream, length,filename: basename(f.path));


    request.files.add(multipartFile);

    var response = await request.send();
    if(response.statusCode==200)
    {
      print("Image Uploaded");
      print(f.path);
    }
    else{
      print(response);
      print("Uploaded failed");
    }
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
  Future<bool>DeletePost(int id) async{
    var response = await http.delete(
      Uri.parse(ServerConfig.DNS +ServerConfig.DeletePost+"${id}"),
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjdhOTk4OTY5YWYzYzY3ZWQ3ZmNjNjkyZjRjOTBhOGRlMDc0ZThhOWYxNzFiOGQ4ZGJkOTk2ZDk2ZGIzMzFmODg1OTMwYjM3ZjQ0MzUxZjgiLCJpYXQiOjE2NjAwMDAxMjAuNzU1MTI3LCJuYmYiOjE2NjAwMDAxMjAuNzU1MTMsImV4cCI6MTY5MTUzNjEyMC42Mjc3NTYsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.JiNIlmVezROI9z_seBIF2F_4ko6O05E4pP57T0DY6sMFPBfq4enyRgDuqQ-8h7SRkxX0gBP-xro8wAi5kxXZEZPKbv9I7eiRgmcV21s8QThD0QbCFuUyRMUPfF03BbRGrQxJX94mVOTjoBp1dKhJdmvm2TMdikn7IXDMAkm7ejpMYvcVlGDB6zXWlGz3nGuhEfqTAIgMieWlo1QdGyf4GDtibFvZ1mmCj-aEp6TuDQ6TOthG7ACvCFLNBfwx0EqXKwld5UwFmiS3sHmWingHvQTRzxzHHNpBktM3ZwJ6AP6W6qcJ4nSTXYiTXJBPeVJmKwSMW2SZNnPHGC3WHrtYjAuYU7EiYlHNk8XNeiDJhrlXxRehzpYs61rEYZYBiCOU17QBHlcho_EosQfYFXINti2PExWOWDDeWnf50NlhX3JIcaSE9ADH5cZqvDnMC9L7C0S95zPoeRHLjRr0BbF_rtd501k3jWwLAyPQqJyhf3p3pD0lXRl8HKxPli5UgL19yKd0GQpULdOrvDpiID9dTVGfhucyZ7fE6m2ajUR7VGGQbGnMCvhGJU_kRU_C5l-ztthi2raLjchONluhHGa75K-vpQPJ72lwUPu7e55xNU2hhfsPaaqAsoPIApmcRnGJb0xMmlHoz3HV2HdhznCWL8_Tj-IGdekGcHLt1oY0pFM'

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



