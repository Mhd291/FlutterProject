import 'package:flutter/material.dart';

import '../constants.dart';

class MyTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType keyBoard;
  final Function(String)ontap;


MyTextField({
    required this.icon,
    required this.hint,
    required this.keyBoard,
    required this.ontap,
});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: size.width*0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor.withAlpha(50),),


         child: TextFormField(
           onChanged: ontap,
        cursorColor: kPrimaryColor,
        keyboardType: keyBoard,
        decoration: InputDecoration(
          icon: Icon(icon,color: kPrimaryColor,),
          hintText: hint,
          border: InputBorder.none,


        ),
      ),

    );
  }
}
