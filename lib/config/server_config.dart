import 'package:monfy_app/models/category.dart';

class ServerConfig {

  //DomainNameServer
  static const DNS = 'http://192.168.102.233:8000';
  //auth
  static const register = '/api/register';
  static const login = '/api/login';
  static const EditProfile = '/api/info';
  static const AllSuggest = '/api/suggest_friend';
  static const MyProfile='/api/my_profile';
  static const AddCoverImage='/api/cover_photo';
  static const AddPersonalImage='/api/profile_photo';
  static const ShowUserProfile='/api/user/';
  static const SendFriendRequest='/api/friends/';
  static const FriendRequests='/api/friends_requester';
  static const AcceptFriend='/api/friends/';
  static const ShowMyFriends='/api/show_my_friend';
  static const ShowAllPosts='/api/show_all_posts';
  static const MakeLike='/api/reaction/';
  static const DeletePost='/api/post/';
  static const AddPost='/api/posts';
  static const Comments='/api/comment/';
  static const Category='/api/category';
  static const Product='/api/all';
  static const ProductByCat='/api/products/';
  static const AddProduct='/api/products';
  static const Search='/api/user';


}