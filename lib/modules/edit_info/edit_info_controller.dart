import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/modules/edit_info/edit_info_service.dart';
import'package:intl/intl.dart';

class EditInfoController extends GetxController {
  /////////////////////////////////////////FirstName
  var data;
  var name;
  var lastname;
  var jop;
  var email;
  var study;
  bool status = false;

  var onChangeFirstNameValue;
  var FirstNameChecked = false.obs;
  var firstNameController = TextEditingController();
  late ExpandableController expandFirstNameController;

  void ChangeFirstName() {
    FirstNameChecked.value = onChangeFirstNameValue!;
    expandFirstNameController.toggle();
    update();
  }
EditEnfoService service = EditEnfoService();
  /////////////////////////////////////////LastName
  var onChangeLastNameValue;
  var onChangeEmailValue;
  var EmailChecked = false.obs;
  var LastNameChecked = false.obs;
  var LastNameController = TextEditingController();
  late ExpandableController expandLastNameController;
  late ExpandableController expandEmailController;

  void ChangeLastName() {
    LastNameChecked.value = onChangeLastNameValue!;
    expandLastNameController.toggle();
    update();
  }
  void ChangeEmail() {
    EmailChecked.value = onChangeEmailValue!;
    expandEmailController.toggle();
    update();
  }

  /////////////////////////////////////////Job
  var onChangeJobValue;
  var jobChecked = false.obs;
  var jobController = TextEditingController();
  late ExpandableController expandJobController;

  void ChangeJob() {
    jobChecked.value = onChangeJobValue!;
    expandJobController.toggle();
    update();
  }

  ////////////////////////////////////////Study
  var onChangeStudyValue;
  var studyChecked = false.obs;
  var studyController = TextEditingController();
  late ExpandableController expandStudyController;

  void ChangeStudy() {
    studyChecked.value = onChangeStudyValue!;
    expandStudyController.toggle();
    update();
  }

  ////////////////////////////////////////Gender


  var selectedDate = DateTime.now().obs;
  var BirthDay;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Year/Month/Day',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
     data=Get.arguments;
    print(data);
    name=data['name'];
    lastname=data['lastname'];
    jop=data['jop'];
    email=data['email'];
    study=data['study'];
    expandFirstNameController = ExpandableController();
    expandLastNameController = ExpandableController();
    expandEmailController = ExpandableController();
    expandJobController = ExpandableController();
    expandStudyController = ExpandableController();
     super.onInit();
  }

  Future<void>onEdit() async{
      print("controller fun");
    status= await service.Edit(name, lastname, jop, email, study,  DateFormat("yyyy - MM - dd")
         .format(
        selectedDate.value)
         .toString());

  }
}
