import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';


class Genderwidget extends StatelessWidget {

 final Function (Gender?) ontap;

  Genderwidget({
    required this.ontap,
});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: false,
        verticalAlignedText: false,
        onChanged: ontap,
        selectedGender: Gender.Male, //By Default
        selectedGenderTextStyle:
        TextStyle(color: Color(0xFFC41A3B), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
        TextStyle(color: Color(0xFF1B1F32), fontWeight: FontWeight.bold),
        equallyAligned: true,
        size: 120.0, // default size 40.0
        animationDuration: Duration(seconds: 1),
        isCircular: true, // by default true
        opacityOfGradient: 0.5,
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
