import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/models/post_in_home.dart';



class HomeService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.ShowAllPosts);


  Future<List<Post>> GetAllPosts() async {
    print("I am here");
    var response = await http.get(
        url,
        headers: {
          'Accept':'application/json',
          //'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOTZjYWFjYmQ2OGRjN2NkNzgzOTVkYTE3NTAwZTAzNjliZDBlYzBhNzIwNDRiZDA4MTk1MTQwODIwZTlhMGVmY2M5MTcyMTIzNzAxZWYzNzkiLCJpYXQiOjE2NTc1Mzk5MjUuMjQ2NDU1LCJuYmYiOjE2NTc1Mzk5MjUuMjQ2NDYzLCJleHAiOjE2ODkwNzU5MjQuODQ2MTg1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.sBDwFKj61SdyPlW0j3Fw8JigaczTZHmv1-rWzFOeoWnIGCpzmR1hGacvSgsOPoz4UtXRAfp_zVHXtD3xDxWz4eLmZaHspyxrdVpI7e-DJQLhsOtKJ3sPmwedgtlDB3jeDOMLwFAjU14GsSKJZheLhzzTDEffqTCWDDsgzj6zRuUX5JvuUHX0031VyEEjNXzBsAEKFDk0olMQrD7sdIqsKc-VC9Lp_choz1A48FeGeAKDD96cUWAPRXvX2OuDkRQUfB7vTba8cBO0e5hNU4yzVG3vS999FyFlpNjnz2GwUIggJWnPYIvRJln-D1ayCGqZEasFuvYOIUwWzd-HnF9TxTnnsUZ8VHTJFeit6XTR0rPkDk73gQ2iTYwc6HfZdK7-BXghmmOtkLDgMUDhB465OOw0kjEJKP3yLMOi1ehuA3h4Yns4CwsiuVc_WnEvBywhMDTs3F2R99ifSOI_WxljHuk3FaQzamvLElUxWUQkd6qWaHF03OcUdJ0Tazhs9Y-RD8XSnlmWVSsCn4FctYXt7EEFl9Bef7F2hyitUGZLzkttly2UyqA73P_f4Hg2FpkRhC3x9F8gx0HHlzSMghKyowD9dlJ44iVvFWhF5lv-lQ-VYeuw3bVDs11cCu6IPVcvz703dGEl2HhogssAEfNFHGBVftwi4lxy5ofziPUHUEk'
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWEwODE1OWNmNDAzYjYyNzVjMzQ4MTlmMjM0YmRjMzc4OTQ5Mjg5MDhlYTg4MzFmZmY3M2IxNmRjMWUwYjY5YzIwNTJmNjhjOGM2YzJmMzkiLCJpYXQiOjE2NTk5NzM2NDQuNDg0MjE2LCJuYmYiOjE2NTk5NzM2NDQuNDg0MjE5LCJleHAiOjE2OTE1MDk2NDQuMjQzOTg3LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.ZQ8HY3lrU_5gV_jQ35pOuOU8AMtsNFnu2pnfz29kbx6zXGc1wGgPyIjcwDuYd4oSceAibYy_hrAJuIYhnnWm0TaJe46jfgLXpbV9T8AnIW6p15p2RGM7RUGfj-cyDI98VAN5vT4cSVWH7z1umSFtkEUwa1V2qUrOoy2mWoSoZ2caVD_1Y-7nMrIVYQs7MpF24BT1kIot31-0cN53iRyLQE8Pg3s3bqM7v3IYFaahBCMDJyFiwlKltZFEyummsQ9KH0kszZh9FE6TjQuE6XLgLnqrbmZVCFTKtSMkWra2V2a-RRa5a6371hSccVl8FB80lpzd3ftWTVAHGkSNGaMyYdLJAigZhplc_b8Nl1oeSsVvXfGMNGVKFNxWKNCr2jrKsPUZowQNJgDMDu5xrhqlW99Lg2CWt6VBvRzlF9Gah8uyt_FnuGj3BnGHmgtzY3l-ZXi4god_P8PRgwBiQW9hC5jXpAqsGg25903ILYmYDo33a8BzCozd8j8wb4Q8uEgqtKMBQfCVkhYzViGPtg5CIhteF_-i5qUx8-I-L8VaqwQNozOVipgAje52A7Cv5Vv3QS11VTUrJwq2eXGDdeJmnRceNSd3k8Qau7pqp44yKL8GXSpnjsBvGMt7ovDAm0TfMY6o6KLbE6lttMV1yyaTjFKfd36M5AGnlUm6BkI6UKM'

        });
    if(response.statusCode==200)
    {
      var UsersResponse = homePostsFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      return UsersResponse.posts;
    }
    else return [];
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



