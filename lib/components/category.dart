import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryItem extends StatelessWidget{

  final String title;
  final String img;
  Color c =Colors.white;
  CategoryItem ( this.title,this.img);



  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 140,
        width: 140,
        decoration:const  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),

        ),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(8,8,8,5),
              child: Text(title,style: const TextStyle(fontSize: 22,fontFamily: 'FFF'),),
            ),
            Image.network(img,height: 80,width: 80,),

          ],
        ),
      );




  }

}