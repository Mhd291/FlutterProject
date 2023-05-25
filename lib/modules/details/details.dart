import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';

class EditInfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var maincolor = kPrimaryColor;

    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        toolbarHeight: 90,
        backgroundColor: maincolor,
        elevation: 0.0,
        title: Text(
          'Edit Your '
              '\nInformation',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(

            ),
          ),
        ),
      ),
    );
  }
}
