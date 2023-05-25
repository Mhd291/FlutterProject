import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/models/freind_request.dart';


class FreindRequestService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.FriendRequests);
  var url1= Uri.parse(ServerConfig.DNS +ServerConfig.AcceptFriend);

  Future<List<Requester>> GetRequests() async {
    print("I search for a request");
    var response = await http.get(
        url,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWEwODE1OWNmNDAzYjYyNzVjMzQ4MTlmMjM0YmRjMzc4OTQ5Mjg5MDhlYTg4MzFmZmY3M2IxNmRjMWUwYjY5YzIwNTJmNjhjOGM2YzJmMzkiLCJpYXQiOjE2NTk5NzM2NDQuNDg0MjE2LCJuYmYiOjE2NTk5NzM2NDQuNDg0MjE5LCJleHAiOjE2OTE1MDk2NDQuMjQzOTg3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.ZQ8HY3lrU_5gV_jQ35pOuOU8AMtsNFnu2pnfz29kbx6zXGc1wGgPyIjcwDuYd4oSceAibYy_hrAJuIYhnnWm0TaJe46jfgLXpbV9T8AnIW6p15p2RGM7RUGfj-cyDI98VAN5vT4cSVWH7z1umSFtkEUwa1V2qUrOoy2mWoSoZ2caVD_1Y-7nMrIVYQs7MpF24BT1kIot31-0cN53iRyLQE8Pg3s3bqM7v3IYFaahBCMDJyFiwlKltZFEyummsQ9KH0kszZh9FE6TjQuE6XLgLnqrbmZVCFTKtSMkWra2V2a-RRa5a6371hSccVl8FB80lpzd3ftWTVAHGkSNGaMyYdLJAigZhplc_b8Nl1oeSsVvXfGMNGVKFNxWKNCr2jrKsPUZowQNJgDMDu5xrhqlW99Lg2CWt6VBvRzlF9Gah8uyt_FnuGj3BnGHmgtzY3l-ZXi4god_P8PRgwBiQW9hC5jXpAqsGg25903ILYmYDo33a8BzCozd8j8wb4Q8uEgqtKMBQfCVkhYzViGPtg5CIhteF_-i5qUx8-I-L8VaqwQNozOVipgAje52A7Cv5Vv3QS11VTUrJwq2eXGDdeJmnRceNSd3k8Qau7pqp44yKL8GXSpnjsBvGMt7ovDAm0TfMY6o6KLbE6lttMV1yyaTjFKfd36M5AGnlUm6BkI6UKM'

        }
        );
    if(response.statusCode==200)
    {
      var UsersResponse = freindRequestFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      return UsersResponse.requester;
    }
    else {
      print("error ya meallem");
      return [];
    }
  }
  Future<bool> AcceptFreind(int id) async{
    print("I will accept");
    var response = await http.patch(
        Uri.parse(ServerConfig.DNS +ServerConfig.AcceptFriend+"${id}"),
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGRjMGZjMzQ5YjYxZGYyZTMwNWZlZWE1MTkxZWU4MzdkM2E0MWIzNTAzZTVmMDQ5ZGVlODVmYTMxYTNlMjIyNjNhODc3YzU3MGY0ZjQ3ODIiLCJpYXQiOjE2NTk2MjA4NzMuNDEyNTg1LCJuYmYiOjE2NTk2MjA4NzMuNDEyNTksImV4cCI6MTY5MTE1Njg3My4xNjA5NDYsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.oxp4qJbHyU8HQrYz7kPe6lWYL5YQ-ibmk-ZJJgMPBBWghU_Sy5AtYmqS3YVkA_h1UjB23vWgCB5CnebD45CGCZNvj4ASlUS3sS5GaGqcCfPdlEIHVkVGGFcYjI2kso6pl2FcTGTmT0nc7ZcYeuTMU6gY2kTt3A5b7tcN3tW7h0EzNJk3IjtBHdCJZu_iw2109x7lzufEDW9rJrcEwwNijTx5ch5UkNQHdL8HBfi65q1CUk4lOHhyf-NMimYs_nZs7oDeyHxwrU8utt7NlbknFeNMGXbMhW6uW-wqbg7LsZaDypRZoZaP7BG4dqmXfP0rFS1ndkCaKDIop5THuB-GOps38bkAClVeFAL3KvSTPJZPXBX3mXgZDsDjMNwYnoW9nKEXo-LMNwyiWPqbjYwtl0k5lXUdHxZmu9YIgOY9_zGtnp-IthCMtw7n2lVPTH57ZJRsM3dyrm8_uShghkK-WJgIIaw0YOAlhAOhBfF1WRgDPKIGCwVVG1g4pgC_iwjG9KIIe3HcA-UVGzNQjhaXR3ZfxpofzwxnqZ0ClnCyuhTzaPGjJIT6uNwkz6PUrZSMbA3zpmP5KZZVaDM5Dos4n7MobffWopXnNJe-vjtdOOBfroPpcWjEdETlrq3OFv7x2CehaNef9M_xPFxOs22tnLGBuA3c4-0Ej9AFRt82Hr0'
       
        }
    );
    if(response.statusCode==200)
    {

      print("Accepted");
      print(response.statusCode);
      print(response.body);
      return true;
    }
    else {
      print("error ya meallem");
      return false;
    }
  }
  Future<bool> DenyFreind(int id) async{
    print("I will deny");
    var response = await http.get(
        Uri.parse(ServerConfig.DNS +ServerConfig.AcceptFriend+"${id}"),
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMzc3MjdhOWY0MDk5ZWQwMDcxOTA3YWRjOTQyZmFkODAxMWMzZjE2ZWZjMTJmMmQyMjA3ZGMyOTNlMGU5NmI1NWQwMzRkOTQ2MDc0ZmQ5YjMiLCJpYXQiOjE2NTg2ODI3MzguODcxNzgxLCJuYmYiOjE2NTg2ODI3MzguODcxNzg5LCJleHAiOjE2OTAyMTg3MzguNTc4MjQ5LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.FBXXc7SOrpUf8iAHssDS9A8WC72kNnsaEAgkTBywUU67NOz1EuWNR1nJiCAA6tgOq03o0sA1YzrQxureS--pnnjM8s4nR39l8acsZ2bXq5ly5EIsG7RgUpl2O7kvp66bnfOENpMHA-SfaOPdyOSrxOPdRMrNKC2SHievyEWy1WeLWm2WpAsAvIbVdsfyhIwUXVzimAB9OL-sy_UYiYOPQ3_cEWd2vDg5pluSWuDwilPPj8H1pvbJgkxeUzrHuYhrS9hR0qqShXxMKsGlv6nzmUaiiFllNJ7tEe9Z52aCABQVZoy5bNJ6mTcmys-beqfisclH9UU6IeY1H1cBhdIH67rHtVrmgk5qeenLe17XBJ8Nf04y99uo9PagOBGOVAiakmDCHijP1V104bZeeBT4vrf7pjp194J2-mJklyN92ySy3GPI_ulxoR0MERxH_6jJu9kivAF5TxRRr8z6ceLcWmNEHPYhPPc4nlgyvw_WdxVJZcW8MN3KXUnNRKKSp_Ak_JOFoLIS4M-iWht-cSC3KhpT82wwNh8LuZbgSjfPYXIVSq0SkCBeEIpGXmATd0W3s9YsSC7pEKde-5X6tOhxIj59c80HkHY8mnFopwh7HBlo6LarbWIQVKjdVjUI5RyM-LgX1vjrTLZwkOHCiGzRvWNTphUEMmKnZ22Pe-mrU-M'

        }
    );
    if(response.statusCode==200)
    {

      print("Denyed");
      print(response.statusCode);
      print(response.body);
      return true;
    }
    else {
      print("error ya meallem");
      return false;
    }
  }

}



