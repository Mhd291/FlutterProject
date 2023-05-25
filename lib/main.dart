import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/getx_bindings/all_users_binding.dart';
import 'package:monfy_app/getx_bindings/dashboard_binding.dart';
import 'package:monfy_app/getx_bindings/home_binding.dart';
import 'package:monfy_app/getx_bindings/log_bindings.dart';
import 'package:monfy_app/getx_bindings/my_profile_binding.dart';
import 'package:monfy_app/getx_bindings/requests_binding.dart';
import 'package:monfy_app/getx_bindings/splash_binding.dart';
import 'package:monfy_app/getx_bindings/user_profile_binding.dart';
import 'package:monfy_app/getx_bindings/video_binding.dart';
import 'package:monfy_app/modules/all_users/all_users_screen.dart';
import 'package:monfy_app/modules/any_friend/any_friend.dart';
import 'package:monfy_app/modules/comments/comments_screen.dart';
import 'package:monfy_app/modules/dash_board/dash_board.dart';
import 'package:monfy_app/modules/home/home_page.dart';
import 'package:monfy_app/modules/image_show/image_screen.dart';
import 'package:monfy_app/modules/intro_slider/intro_slider.dart';
import 'package:monfy_app/modules/market/category_page.dart';
import 'package:monfy_app/modules/market/market_page.dart';
import 'package:monfy_app/modules/my_friends/my_friends_screen.dart';
import 'package:monfy_app/modules/my_profile/my_profile_page.dart';
import 'package:monfy_app/modules/navigation_bar.dart';
import 'package:monfy_app/modules/requester_profile/onther_user_screen.dart';
import 'package:monfy_app/modules/search/search_page.dart';
import 'package:monfy_app/modules/splash/splash_page.dart';
import 'package:monfy_app/video_page/video_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'getx_bindings/my_friends_binding.dart';
import 'modules/add_post/add_post_screen.dart';
import 'modules/add_product/add_product_page.dart';
import 'modules/drawer/drawer_page.dart';
import 'modules/edit_info/edit_info_screen.dart';
import 'modules/freinds/freinds_page.dart';
import 'modules/friend_profile/friend_profile.dart';
import 'modules/log_in/log_in_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'modules/log_in/log_service.dart';
import 'modules/market/product.dart';
import 'modules/notification/notification_page.dart';
import 'modules/user_profile/user_profiile_screen.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 // FirebaseMessaging.instance.getToken();
  runApp( MyApp());
}

 class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: '/home',
      getPages:
      [
        GetPage(name: '/login', page: ()=>LoginScreen(),binding:LogBinding()),
        GetPage(name: '/splash', page: ()=>SplashPage(),binding: SplashBinding()),
        GetPage(name: '/slide', page: ()=>IntroSlider()),
        GetPage(name: '/any_friend', page: ()=>AnyFriend()),
        GetPage(name: '/request_friend', page: ()=>RequesterProfile()),
        GetPage(name: '/product', page: ()=>DetailsPage()),
        GetPage(name: '/friend_profile', page: ()=>FreindProfile()),
        GetPage(name: '/edit', page: ()=>EditInfoScreen()),
        GetPage(name: '/myprofile', page: ()=>MyProfile(),binding:MyProfileBinding()),
        GetPage(name: '/Fr_re', page: ()=>Freinds(),binding: HomeBinding()),
        GetPage(name: '/market', page: ()=>Market(),binding: HomeBinding()),
        GetPage(name: '/noti', page: ()=>MyNotification(),binding: HomeBinding()),
        GetPage(name: '/home', page: ()=>DrawerPage(),binding: HomeBinding()),
        GetPage(name: '/nav', page: ()=>Navigation()),
        GetPage(name: '/add_product', page: ()=>AddProductPage()),
        GetPage(name: '/search', page: ()=>Search()),
        GetPage(name: '/cat', page: ()=>CategoryPage()),
        GetPage(name: '/userprofile', page: ()=>UserProfile(),binding: UserProfileBinding()),
        GetPage(name: '/allusers', page: ()=>AllUsers(),binding:AllUsersBinding() ),
        GetPage(name: '/my_friends', page: ()=>My_Freinds(),binding:MyFriendsBinding() ),
        GetPage(name: '/add_post', page: ()=>AddPostScreen() ),
        GetPage(name: '/comment', page: ()=>CommentsScreen() ),
        GetPage(name: '/video_page', page: ()=>VideoPage() ,binding: VideoBinding()),
       // GetPage(name: '/friends', page: ()=>Freinds(),binding:FriendRequestBinding() ),
        GetPage(name: '/image', page: ()=>Imager() ),
      ],
      builder: EasyLoading.init(),
    );
  }

}
