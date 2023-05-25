import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/constants.dart';

 Future  ShowInfo(String email, String gender, String birthdate, String job, String study) {

  TextEditingController getEmail = TextEditingController();
  TextEditingController getGender = TextEditingController();
  TextEditingController getBirthdate = TextEditingController();
  TextEditingController getJob = TextEditingController();
  TextEditingController getStudy = TextEditingController();
  getEmail.text = email;
  getGender.text = gender;
  getBirthdate.text = birthdate;
  getJob.text = job;
  getStudy.text = study;
  return Get.defaultDialog(
    title: 'Information',
    content: Container(
      child: Column(
        children: [
          TextField(
            enabled: false,
            controller: getEmail,
            decoration: InputDecoration(
              prefix: Text('Email:'),
            ),
          ),
          TextField(
            enabled: false,
            controller: getGender,
            decoration: InputDecoration(
              prefix: Text('Gender:'),
            ),
          ),
          TextField(
            enabled: false,
            controller: getBirthdate,
            decoration: InputDecoration(
              prefix: Text('Birthdate:'),
            ),
          ),
          TextField(
            enabled: false,
            controller: getJob,
            decoration: InputDecoration(
              prefix: Text('Job:'),
            ),
          ),
          TextField(
            enabled: false,
            controller: getStudy,
            decoration: InputDecoration(
              prefix: Text('Study:'),
            ),
          ),
        ],
      ),
    ),
    textCancel: "Cancel",
    cancelTextColor: kPrimaryColor,
    buttonColor: kPrimaryColor,
  );
}