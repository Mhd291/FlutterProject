import 'dart:io';
import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';



class AddPostService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.AddPost);

  Future<bool>AddPost(File f,String s)async {
    print("Hello Posts");
    var stream = new http.ByteStream(DelegatingStream.typed(f.openRead()));
    var length =await f.length();
    var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddPersonalImage);
    var request = new http.MultipartRequest("POST", url);
    request.headers.addAll({ 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNTlmNmNhZGM5YmE0OWY1ODA5OGQ1MzBiYjFhY2Q4MmI2MDhhYzM3ODk3ZDIxNWUwNTkxY2U3NmFmOGI0MzhlNDRjOTAzZGZiNmU1NzcwMmIiLCJpYXQiOjE2NTg2Nzc5OTkuODc4NTc5LCJuYmYiOjE2NTg2Nzc5OTkuODc4NTg0LCJleHAiOjE2OTAyMTM5OTkuNTM1NzU4LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.Jt5x08h-8oc0FZO15JXOsZ3ZN4j3C5msAtTovHxpByuhAj8cipcUG-e8ezrDd86O4mFLbvbiyTK-Z7qhlK3U4yBjjwyBH6yAlLfyjvQvzdr7DxwyfRspX1W6lpkV4_DmDSqIohgXEvQoBOjGYOYdav0e45_cPyLhoA9IEWYuHKdfBZ0HoBEU2Bo_yKU08mk8tLU7JctBWXDhViRaZFCmzGDJhUsDdtWNiEa3nohNMe0VuNzLDHSkWmnNVSRoVZlVg1aZcMYUimC9vyTW-A8DdHDcO2IO_fiVSetSHUWN667QpQzHqIkTh6wcXKHomb9TIm0ZKxNSQGIKrfPrumtJFJMGUEJcjenyKg0htISWub8AiwBUhLTt3bQCvc92APCCvcBgvMC3H1siwNWT-h_Q6eIyAoU36VJAoDCR1ndrhn10eaz1hD8gTLjFKWXof8XNIEe4Vdm0nKQfA-F_BFh3uTllQAUKs_u1ig_IVH_vrHEK5Yog6YdelzcxXlOB7TGzJpDo1oknUVgyHNJX6ZXLcWOQ1fZ7ElJmK0v6AcgdrW02WG6uDndiTgUHvG-x-1FMKfeKLA0xzn67ailkbkUgzx3H99l1hMDTCnWvbRiGmGdNpwUFs3ECStf0iLXWTT9pfjXsEksJaPGPP-SvG5p_IalY4SxmCp5u9Wpo8mNYEes'

    });

    var multipartFile = new http.MultipartFile("files[]", stream, length,filename: basename(f.path));


    request.files.add(multipartFile);
    request.fields['body']=s;

    var response = await request.send();
    if(response.statusCode==200)
    {
      return true;

    }
    else{
      return false;

    }
  }
  Future<bool>AddPost2(String s)async {
    print("Hello Posts");

    var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddPersonalImage);
    var request = new http.MultipartRequest("POST", url);
    request.headers.addAll({ 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNTlmNmNhZGM5YmE0OWY1ODA5OGQ1MzBiYjFhY2Q4MmI2MDhhYzM3ODk3ZDIxNWUwNTkxY2U3NmFmOGI0MzhlNDRjOTAzZGZiNmU1NzcwMmIiLCJpYXQiOjE2NTg2Nzc5OTkuODc4NTc5LCJuYmYiOjE2NTg2Nzc5OTkuODc4NTg0LCJleHAiOjE2OTAyMTM5OTkuNTM1NzU4LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.Jt5x08h-8oc0FZO15JXOsZ3ZN4j3C5msAtTovHxpByuhAj8cipcUG-e8ezrDd86O4mFLbvbiyTK-Z7qhlK3U4yBjjwyBH6yAlLfyjvQvzdr7DxwyfRspX1W6lpkV4_DmDSqIohgXEvQoBOjGYOYdav0e45_cPyLhoA9IEWYuHKdfBZ0HoBEU2Bo_yKU08mk8tLU7JctBWXDhViRaZFCmzGDJhUsDdtWNiEa3nohNMe0VuNzLDHSkWmnNVSRoVZlVg1aZcMYUimC9vyTW-A8DdHDcO2IO_fiVSetSHUWN667QpQzHqIkTh6wcXKHomb9TIm0ZKxNSQGIKrfPrumtJFJMGUEJcjenyKg0htISWub8AiwBUhLTt3bQCvc92APCCvcBgvMC3H1siwNWT-h_Q6eIyAoU36VJAoDCR1ndrhn10eaz1hD8gTLjFKWXof8XNIEe4Vdm0nKQfA-F_BFh3uTllQAUKs_u1ig_IVH_vrHEK5Yog6YdelzcxXlOB7TGzJpDo1oknUVgyHNJX6ZXLcWOQ1fZ7ElJmK0v6AcgdrW02WG6uDndiTgUHvG-x-1FMKfeKLA0xzn67ailkbkUgzx3H99l1hMDTCnWvbRiGmGdNpwUFs3ECStf0iLXWTT9pfjXsEksJaPGPP-SvG5p_IalY4SxmCp5u9Wpo8mNYEes'

    });

    request.fields['body']=s;

    var response = await request.send();
    if(response.statusCode==200)
    {
      return true;

    }
    else{
      return false;

    }
  }
}








