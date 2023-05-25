import 'package:flutter/material.dart';

import '../constants.dart';

class LogButton extends StatelessWidget {

final Function()press;
final String name;

LogButton({
  required this.press,
  required this.name,
});
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        width: size.width*0.8,
        height: size.height*0.065,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor),

         child: Center(
           child: Text(name,style: TextStyle(fontSize:20,color: Colors.white ),),
         ),

      ),
    );
  }
}
