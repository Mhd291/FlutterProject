import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

class MyNotification extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
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
                        }, icon: Icon(Icons.home)),
                        IconButton(onPressed: (){Get.toNamed('/fr_re');}, icon: Icon(Icons.groups)),
                        IconButton(onPressed: (){Get.toNamed('/myprofile');}, icon: Icon(Icons.account_circle)),
                        IconButton(onPressed: (){Get.toNamed('/market');}, icon: Icon(Icons.shopping_cart)),
                        IconButton(onPressed: (){Get.toNamed('/noti');}, icon:  Icon(Icons.notifications,color: kPrimaryColor,)),
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
