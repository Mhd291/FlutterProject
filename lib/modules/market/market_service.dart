
import 'package:monfy_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:monfy_app/models/category.dart';
import 'package:monfy_app/models/product.dart';



class MarketService{

  var url = Uri.parse(ServerConfig.DNS +ServerConfig.Category);
  var url1= Uri.parse(ServerConfig.DNS +ServerConfig.Product);
  var url2= Uri.parse(ServerConfig.DNS +ServerConfig.ProductByCat);

  Future<List<Category>> GetCategories() async {
    print("I search for a request");
    var response = await http.get(
        url,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTExZGIxYmJhZDAxN2ZjOGY3NDJiMzQyYTk2NGVhM2QxMDVjZGIyMjYwMTdlN2Q4ZWFiODk0Mzc0NTEzMzE1NGYyMWI1MTFlNGM3NjVjNTQiLCJpYXQiOjE2NTk2OTQ5MDYuMDcyOTA3LCJuYmYiOjE2NTk2OTQ5MDYuMDcyOTE4LCJleHAiOjE2OTEyMzA5MDUuMDQ3MzkyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.Ridgg9YVD3_uDYCbOMcLJkVX1U6TlfwQpb1UwLW15hAl6_f8anS-usvsTv5_Svk6nVIJ8li67Ck0i4etooutwYcGijwzjrKj4ZJ5Y_-6oRWpiIm7uYXU9V97CDiY1HPdAguLxI4JP1l13xOomz4EP0yVq4ANQ1xvToEWmlKY4LXRU2FnrUhYRCx6gew4BIA7KAXfkSmaZ4VN3K0vmrBc8NnbxfIgAFu19o9CuBYQLCIMLuScaOaEoc44y7CkyndNBePwaRm7qe0_0FyEo0tmsasUhsS7uDNp6CWTd7piesj0PNLzcfJja2-OpDDHu7GRQWPcdhYxI0YeTgqMLVJNd5kjKNJeLgOa2UI6fEhnDxFOhJFw1PSv9zj3BgI31cxg5_DOUJK_BGDGKZRSb9NaPSLxMjIKTKWzBu113qXichzf8KquAT1_71fKtdrf40SAKlyTOUMedknUncW_F_CjGfwrrYZgItKqrXzdprFB7QtqBx1hz2gSljU2LloMrGQTj1mM-GwTuEFb4gRRFMOzdgHiZxGRrcyzb33A8KOOPTW1LBReeQpJduAGr_JXezd9Yc_xn5ur7w2FfqhQqD7kVr6AgaVuX4GHCWNh38lIJowAi375RmNUbbXxx7iKX6mRKHLfDo1HH6SloA0EHHN_dk0hd4Q2NNmfsz9Pk_x7eEc'

        }
    );
    if(response.statusCode==200)
    {
      var UsersResponse = categoriesFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      return UsersResponse.category;
    }
    else {
      print("error ya meallem");
      return [];
    }
  }
  Future<List<Product>> GetProducts() async {
    print("I search for a request");
    var response = await http.get(
        url1,
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTExZGIxYmJhZDAxN2ZjOGY3NDJiMzQyYTk2NGVhM2QxMDVjZGIyMjYwMTdlN2Q4ZWFiODk0Mzc0NTEzMzE1NGYyMWI1MTFlNGM3NjVjNTQiLCJpYXQiOjE2NTk2OTQ5MDYuMDcyOTA3LCJuYmYiOjE2NTk2OTQ5MDYuMDcyOTE4LCJleHAiOjE2OTEyMzA5MDUuMDQ3MzkyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.Ridgg9YVD3_uDYCbOMcLJkVX1U6TlfwQpb1UwLW15hAl6_f8anS-usvsTv5_Svk6nVIJ8li67Ck0i4etooutwYcGijwzjrKj4ZJ5Y_-6oRWpiIm7uYXU9V97CDiY1HPdAguLxI4JP1l13xOomz4EP0yVq4ANQ1xvToEWmlKY4LXRU2FnrUhYRCx6gew4BIA7KAXfkSmaZ4VN3K0vmrBc8NnbxfIgAFu19o9CuBYQLCIMLuScaOaEoc44y7CkyndNBePwaRm7qe0_0FyEo0tmsasUhsS7uDNp6CWTd7piesj0PNLzcfJja2-OpDDHu7GRQWPcdhYxI0YeTgqMLVJNd5kjKNJeLgOa2UI6fEhnDxFOhJFw1PSv9zj3BgI31cxg5_DOUJK_BGDGKZRSb9NaPSLxMjIKTKWzBu113qXichzf8KquAT1_71fKtdrf40SAKlyTOUMedknUncW_F_CjGfwrrYZgItKqrXzdprFB7QtqBx1hz2gSljU2LloMrGQTj1mM-GwTuEFb4gRRFMOzdgHiZxGRrcyzb33A8KOOPTW1LBReeQpJduAGr_JXezd9Yc_xn5ur7w2FfqhQqD7kVr6AgaVuX4GHCWNh38lIJowAi375RmNUbbXxx7iKX6mRKHLfDo1HH6SloA0EHHN_dk0hd4Q2NNmfsz9Pk_x7eEc'

        }
    );
    if(response.statusCode==200)
    {
      var UsersResponse = productsFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      return UsersResponse.products;
    }
    else {
      print("error ya meallem");
      return [];
    }
  }
  Future<List<Product>> GetProductsByCat(int id) async {
    print("I search for a request");
    var response = await http.get(
        Uri.parse(ServerConfig.DNS +ServerConfig.ProductByCat+"${id}"),
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYTExZGIxYmJhZDAxN2ZjOGY3NDJiMzQyYTk2NGVhM2QxMDVjZGIyMjYwMTdlN2Q4ZWFiODk0Mzc0NTEzMzE1NGYyMWI1MTFlNGM3NjVjNTQiLCJpYXQiOjE2NTk2OTQ5MDYuMDcyOTA3LCJuYmYiOjE2NTk2OTQ5MDYuMDcyOTE4LCJleHAiOjE2OTEyMzA5MDUuMDQ3MzkyLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.Ridgg9YVD3_uDYCbOMcLJkVX1U6TlfwQpb1UwLW15hAl6_f8anS-usvsTv5_Svk6nVIJ8li67Ck0i4etooutwYcGijwzjrKj4ZJ5Y_-6oRWpiIm7uYXU9V97CDiY1HPdAguLxI4JP1l13xOomz4EP0yVq4ANQ1xvToEWmlKY4LXRU2FnrUhYRCx6gew4BIA7KAXfkSmaZ4VN3K0vmrBc8NnbxfIgAFu19o9CuBYQLCIMLuScaOaEoc44y7CkyndNBePwaRm7qe0_0FyEo0tmsasUhsS7uDNp6CWTd7piesj0PNLzcfJja2-OpDDHu7GRQWPcdhYxI0YeTgqMLVJNd5kjKNJeLgOa2UI6fEhnDxFOhJFw1PSv9zj3BgI31cxg5_DOUJK_BGDGKZRSb9NaPSLxMjIKTKWzBu113qXichzf8KquAT1_71fKtdrf40SAKlyTOUMedknUncW_F_CjGfwrrYZgItKqrXzdprFB7QtqBx1hz2gSljU2LloMrGQTj1mM-GwTuEFb4gRRFMOzdgHiZxGRrcyzb33A8KOOPTW1LBReeQpJduAGr_JXezd9Yc_xn5ur7w2FfqhQqD7kVr6AgaVuX4GHCWNh38lIJowAi375RmNUbbXxx7iKX6mRKHLfDo1HH6SloA0EHHN_dk0hd4Q2NNmfsz9Pk_x7eEc'

        }
    );
    if(response.statusCode==200)
    {
      var UsersResponse = productsFromJson(response.body);
      print(response.statusCode);
      print(response.body);
      return UsersResponse.products;
    }
    else {
      print("error ya meallem");
      return [];
    }
  }
}



