import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:monfy_app/models/my_user.dart';
import 'intro_slider_service.dart';
class IntroController extends GetxController {
  IntroService service = new IntroService();
  //////////////////////////////////
  late ExpandableController expandController;
  late ExpandableController expandController1;
  var jobValue= TextEditingController();
  var studyValue= TextEditingController();
  var checked = false.obs;
  var isStudying = false.obs;
  var SetStatuse=false;
  var message;
  ///////////////////////////////////
  var Gender="Male";
  var selectedDate = DateTime.now().obs;
  var Jop;
  var Study;
  var BirthDay;
  /////////////////////////////////////
  Future<void> SetInfo()async {
    print(Gender);

    User user = User(Gender: "${Gender}",BirthDay: "${selectedDate}",Jop: Jop,Study: Study);
    SetStatuse =await service.login(user);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }
  void change(){
    update();
  }
  ////////////////////////////////////////////
  @override
  void onInit() {
    super.onInit();
    expandController=ExpandableController();
    expandController1=ExpandableController();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    expandController.dispose();
    expandController1.dispose();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Year/Month/Day',);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }


}