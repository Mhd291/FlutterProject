import 'dart:io';
import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';



class AddProductService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.AddProduct);

  Future<bool>AddProduct(String id,String price,File img,String name,String desc,String region)
  async {
    print("Hello Posts");
    var stream = new http.ByteStream(DelegatingStream.typed(img.openRead()));
    var length =await img.length();
    var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddPersonalImage);
    var request = new http.MultipartRequest("POST", url);
    request.headers.addAll({'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTExZGIxYmJhZDAxN2ZjOGY3NDJiMzQyYTk2NGVhM2QxMDVjZGIyMjYwMTdlN2Q4ZWFiODk0Mzc0NTEzMzE1NGYyMWI1MTFlNGM3NjVjNTQiLCJpYXQiOjE2NTk2OTQ5MDYuMDcyOTA3LCJuYmYiOjE2NTk2OTQ5MDYuMDcyOTE4LCJleHAiOjE2OTEyMzA5MDUuMDQ3MzkyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.Ridgg9YVD3_uDYCbOMcLJkVX1U6TlfwQpb1UwLW15hAl6_f8anS-usvsTv5_Svk6nVIJ8li67Ck0i4etooutwYcGijwzjrKj4ZJ5Y_-6oRWpiIm7uYXU9V97CDiY1HPdAguLxI4JP1l13xOomz4EP0yVq4ANQ1xvToEWmlKY4LXRU2FnrUhYRCx6gew4BIA7KAXfkSmaZ4VN3K0vmrBc8NnbxfIgAFu19o9CuBYQLCIMLuScaOaEoc44y7CkyndNBePwaRm7qe0_0FyEo0tmsasUhsS7uDNp6CWTd7piesj0PNLzcfJja2-OpDDHu7GRQWPcdhYxI0YeTgqMLVJNd5kjKNJeLgOa2UI6fEhnDxFOhJFw1PSv9zj3BgI31cxg5_DOUJK_BGDGKZRSb9NaPSLxMjIKTKWzBu113qXichzf8KquAT1_71fKtdrf40SAKlyTOUMedknUncW_F_CjGfwrrYZgItKqrXzdprFB7QtqBx1hz2gSljU2LloMrGQTj1mM-GwTuEFb4gRRFMOzdgHiZxGRrcyzb33A8KOOPTW1LBReeQpJduAGr_JXezd9Yc_xn5ur7w2FfqhQqD7kVr6AgaVuX4GHCWNh38lIJowAi375RmNUbbXxx7iKX6mRKHLfDo1HH6SloA0EHHN_dk0hd4Q2NNmfsz9Pk_x7eEc'

    });

    var multipartFile = new http.MultipartFile("img", stream, length,filename: basename(img.path));


    request.files.add(multipartFile);
    request.fields['name']=name;
    request.fields['price']=price;
    request.fields['exp_date']="1999-1-1";
    request.fields['description']=desc;
    request.fields['quantity']="44";
    request.fields['category_id']=id;
    request.fields['region']=region;

    var response = await request.send();
    print(response.statusCode);
    print(response.reasonPhrase);
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








