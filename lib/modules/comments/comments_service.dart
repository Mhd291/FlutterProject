import 'dart:convert';
import 'dart:io';

import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/models/comments.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';



class CommentService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.Comments);
  

  Future<List<CommentElement>>GetComments(int id) async {
    print("I am USERRRR");
    print(id);
    var response = await http.get(
        Uri.parse(ServerConfig.DNS +ServerConfig.Comments+"${id}"),
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjdhOTk4OTY5YWYzYzY3ZWQ3ZmNjNjkyZjRjOTBhOGRlMDc0ZThhOWYxNzFiOGQ4ZGJkOTk2ZDk2ZGIzMzFmODg1OTMwYjM3ZjQ0MzUxZjgiLCJpYXQiOjE2NjAwMDAxMjAuNzU1MTI3LCJuYmYiOjE2NjAwMDAxMjAuNzU1MTMsImV4cCI6MTY5MTUzNjEyMC42Mjc3NTYsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.JiNIlmVezROI9z_seBIF2F_4ko6O05E4pP57T0DY6sMFPBfq4enyRgDuqQ-8h7SRkxX0gBP-xro8wAi5kxXZEZPKbv9I7eiRgmcV21s8QThD0QbCFuUyRMUPfF03BbRGrQxJX94mVOTjoBp1dKhJdmvm2TMdikn7IXDMAkm7ejpMYvcVlGDB6zXWlGz3nGuhEfqTAIgMieWlo1QdGyf4GDtibFvZ1mmCj-aEp6TuDQ6TOthG7ACvCFLNBfwx0EqXKwld5UwFmiS3sHmWingHvQTRzxzHHNpBktM3ZwJ6AP6W6qcJ4nSTXYiTXJBPeVJmKwSMW2SZNnPHGC3WHrtYjAuYU7EiYlHNk8XNeiDJhrlXxRehzpYs61rEYZYBiCOU17QBHlcho_EosQfYFXINti2PExWOWDDeWnf50NlhX3JIcaSE9ADH5cZqvDnMC9L7C0S95zPoeRHLjRr0BbF_rtd501k3jWwLAyPQqJyhf3p3pD0lXRl8HKxPli5UgL19yKd0GQpULdOrvDpiID9dTVGfhucyZ7fE6m2ajUR7VGGQbGnMCvhGJU_kRU_C5l-ztthi2raLjchONluhHGa75K-vpQPJ72lwUPu7e55xNU2hhfsPaaqAsoPIApmcRnGJb0xMmlHoz3HV2HdhznCWL8_Tj-IGdekGcHLt1oY0pFM'

        });
    if(response.statusCode==200)
    {
      var CommentResponse = commentFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      //print(MyProfileResponse.user);
      return CommentResponse.comments;

    }
   else return [];
  }

  Future<bool>AddComment(File f,String s,int id)async {
    print("Hello Comments");
    var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddPersonalImage);
    var request = new http.MultipartRequest("POST",  Uri.parse(ServerConfig.DNS +ServerConfig.Comments+"${id}"),);
    request.headers.addAll({ 
     'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDJjMzQwMjU1YWMxZWE5MmIxMjc1YTg2MmUyYWMwNmQyNjM3NDJhMjNlZTQwNTg5MTFhNDc3MDdhOTNhZTFlY2RkNWRhN2U1MWE1MWI4ZjEiLCJpYXQiOjE2NTk5MTc3ODUuNzYzNDE3LCJuYmYiOjE2NTk5MTc3ODUuNzYzNDMyLCJleHAiOjE2OTE0NTM3ODUuMzkxNDM2LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.agZJ5EcNd-BaFD0MlUHoyZnlXlkT7w1iG-AnO9FWz0hj3ilc-fq9EH--S_iLzKSMIneqCvURmLUUDEBQw2NNboctQErs5YmtiClwUbsJ23_K0eG0u9t5FXmQVnKmN2TYole7Yll7T1fdr9SLCpni0oTtf1AKk5wHPTa7QJ4ejHrJuJUuHa1jGcWsxgpHvAba71LKTDR_5BbBIO4q7UtOcLbuQnLypU9sjNQjRy4KZ46NHFjoDmdBeizLjjvKF6IA9sDyo-pRmKuMhCEGwX3SqMpg1DMU46XgFyy5K2kFGY1QOQqfkseJvWzW91Q5hKMKdrb2lP09HVu1e944wO8p9dCPQ6mh2rpoqck1njyjFSjCQoZIRKdnkADpguwgPFtmqtROlCdroHbmz1FW3vge-8JOZFc9HrexvL3sA5lsguiyJ1lhNcCwZPEbB9aWkuyE7uIZ7NAA8po5vmZelVah-NJGraAjKFJwUJg2TwHuCyh46D-G9tTdoh9fCQqEGZpjQ2I7b2g0BGUt7bJwrItjP-lq_RnANa1QWca19r7Ca37zbJ3sTolYCOSafl2kVnmrIPefD-pAVBVyWZUTwTV7MgL-itG9GJASa4AjkMfONEAueEe5iTaIYZjwiSgb0dSNoERbfBF13-shnkJPAXio9KbK3nifuYMIcphgTOZqE_k'
       
    });
    if(f !=null)
      {
        var stream = new http.ByteStream(DelegatingStream.typed(f.openRead()));
        var length =await f.length();


        var multipartFile = new http.MultipartFile("file", stream, length,filename: basename(f.path));
        request.files.add(multipartFile);
      }


    request.fields['value']=s;

    var response = await request.send();
    if(response.statusCode==200)
    {
      print(response.statusCode);
      print("Ok");
      return true;

    }
    else{
      return false;

    }
  }
  Future<bool>AddComment1(String s,int id)async {
    print("Hello Comments");
    var url1 = Uri.parse(ServerConfig.DNS +ServerConfig.AddPersonalImage);
    var request = new http.MultipartRequest("POST",  Uri.parse(ServerConfig.DNS +ServerConfig.Comments+"${id}"),);
    request.headers.addAll({
      'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGRjMGZjMzQ5YjYxZGYyZTMwNWZlZWE1MTkxZWU4MzdkM2E0MWIzNTAzZTVmMDQ5ZGVlODVmYTMxYTNlMjIyNjNhODc3YzU3MGY0ZjQ3ODIiLCJpYXQiOjE2NTk2MjA4NzMuNDEyNTg1LCJuYmYiOjE2NTk2MjA4NzMuNDEyNTksImV4cCI6MTY5MTE1Njg3My4xNjA5NDYsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.oxp4qJbHyU8HQrYz7kPe6lWYL5YQ-ibmk-ZJJgMPBBWghU_Sy5AtYmqS3YVkA_h1UjB23vWgCB5CnebD45CGCZNvj4ASlUS3sS5GaGqcCfPdlEIHVkVGGFcYjI2kso6pl2FcTGTmT0nc7ZcYeuTMU6gY2kTt3A5b7tcN3tW7h0EzNJk3IjtBHdCJZu_iw2109x7lzufEDW9rJrcEwwNijTx5ch5UkNQHdL8HBfi65q1CUk4lOHhyf-NMimYs_nZs7oDeyHxwrU8utt7NlbknFeNMGXbMhW6uW-wqbg7LsZaDypRZoZaP7BG4dqmXfP0rFS1ndkCaKDIop5THuB-GOps38bkAClVeFAL3KvSTPJZPXBX3mXgZDsDjMNwYnoW9nKEXo-LMNwyiWPqbjYwtl0k5lXUdHxZmu9YIgOY9_zGtnp-IthCMtw7n2lVPTH57ZJRsM3dyrm8_uShghkK-WJgIIaw0YOAlhAOhBfF1WRgDPKIGCwVVG1g4pgC_iwjG9KIIe3HcA-UVGzNQjhaXR3ZfxpofzwxnqZ0ClnCyuhTzaPGjJIT6uNwkz6PUrZSMbA3zpmP5KZZVaDM5Dos4n7MobffWopXnNJe-vjtdOOBfroPpcWjEdETlrq3OFv7x2CehaNef9M_xPFxOs22tnLGBuA3c4-0Ej9AFRt82Hr0'
       
    });
    request.fields['value']=s;

    var response = await request.send();
    if(response.statusCode==200)
    {
      print(response.statusCode);
      print("Ok");
      return true;

    }
    else{
      return false;

    }
  }
  Future<bool>DeleteComment(int id) async{
    var response = await http.delete(
      Uri.parse(ServerConfig.DNS +ServerConfig.Comments+"${id}"),
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



