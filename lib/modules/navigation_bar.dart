import 'package:flutter/material.dart';
import 'package:monfy_app/constants.dart';
import 'package:get/get.dart';

class Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 50,
              child:
          Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05
            , 0, MediaQuery.of(context).size.width*0.05, 0),
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kBackgroundColor,

              ),

              child: Row(
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Get.toNamed('/home');
                  }, icon: Icon(Icons.home,color: kPrimaryColor,),focusColor: kPrimaryColor,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.groups)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.account_circle)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
                  IconButton(onPressed: (){}, icon:  Icon(Icons.menu)),
                ],
              ),
            ),
          )
          )
        ],
      ),
    );
  }
}
