import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import 'edit_info_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EditInfoScreen extends StatelessWidget {
  EditInfoController controller1 =
  Get.put(EditInfoController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    var maincolor = kPrimaryColor;

    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
         actions: [
           IconButton(onPressed: ()async{
             print("hello");
             await  controller1.onEdit();
             if(controller1.status =true)
             {
               EasyLoading.showSuccess(" Edited Successfully");
               Get.back();
             }
             else{
               EasyLoading.showError("Not Edited");
             }
           }, icon: Icon(Icons.edit))
         ],
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
              child: Column(
                children: [
                  Card(
                    child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          hasIcon: false,
                          tapHeaderToExpand: false,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                        ),
                        controller: controller1.expandFirstNameController,
                        header: GetBuilder<EditInfoController>(
                          assignId: true,
                          init: EditInfoController(),
                          builder: (controller1) {
                            return CheckboxListTile(
                              title: const Text("update my first name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: kPrimaryColor)),
                              value: controller1.FirstNameChecked.value,
                              onChanged: (value) {

                              controller1.onChangeFirstNameValue = value;
                                controller1.ChangeFirstName();
                              },
                            );
                          },
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: TextField(
                          onChanged: (value){
                            controller1.name=value;
                          },
                          decoration: const InputDecoration(
                              hintText: 'What is your first name?'),
                        )),
                  ),
                  Card(
                    child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          hasIcon: false,
                          tapHeaderToExpand: false,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                        ),
                        controller: controller1.expandLastNameController,
                        header: GetBuilder<EditInfoController>(
                          assignId: true,
                          init: EditInfoController(),
                          builder: (controller1) {
                            return CheckboxListTile(
                              title: const Text("update my last name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: kPrimaryColor)),
                              value: controller1.LastNameChecked.value,
                              onChanged: (value) {

                              controller1.onChangeLastNameValue = value;
                                controller1.ChangeLastName();
                              },
                            );
                          },
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: TextField(
                          onChanged: (value){
                            controller1.lastname=value;
                          },
                          decoration: const InputDecoration(
                              hintText: 'What is your last name?'),
                        )),
                  ),
                  Card(
                    child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          hasIcon: false,
                          tapHeaderToExpand: false,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                        ),
                        controller: controller1.expandEmailController,
                        header: GetBuilder<EditInfoController>(
                          assignId: true,
                          init: EditInfoController(),
                          builder: (controller1) {
                            return CheckboxListTile(
                              title: const Text("Update my Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: kPrimaryColor)),
                              value: controller1.EmailChecked.value,
                              onChanged: (value) {

                              controller1.onChangeEmailValue = value;
                                controller1.ChangeEmail();
                              },
                            );
                          },
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: TextField(
                          onChanged: (value){
                            controller1.email=value;
                          },
                          decoration: const InputDecoration(
                              hintText: 'What is your Email?'),
                        )),
                  ),
                  Card(
                    child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          hasIcon: false,
                          tapHeaderToExpand: false,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                        ),
                        controller: controller1.expandJobController,
                        header: GetBuilder<EditInfoController>(
                          assignId: true,
                          init: EditInfoController(),
                          builder: (controller1) {
                            return CheckboxListTile(
                              title: const Text("update my job",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: kPrimaryColor)),
                              value: controller1.jobChecked.value,
                              onChanged: (value) {

                               controller1.onChangeJobValue = value;
                                controller1.ChangeJob();
                              },
                            );
                          },
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: TextField(
                          onChanged: (value){
                            controller1.jop=value;
                          },
                          decoration: const InputDecoration(
                              hintText: 'What is your job?'),
                        )),
                  ),
                  Card(
                    child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          hasIcon: false,
                          tapHeaderToExpand: false,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                        ),
                        controller: controller1.expandStudyController,
                        header: GetBuilder<EditInfoController>(
                          assignId: true,
                          init: EditInfoController(),
                          builder: (controller1) {
                            return CheckboxListTile(
                              title: const Text("update my Study",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: kPrimaryColor)),
                              value: controller1.studyChecked.value,
                              onChanged: (value) {

                                controller1.onChangeStudyValue = value;
                                controller1.ChangeStudy();
                              },
                            );
                          },
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: TextField(
                          onChanged: (value){
                            controller1.study=value;
                          },
                          decoration: const InputDecoration(
                              hintText: 'What is your Study?'),
                        )),
                  ),



                  Card(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Change your Birthday",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: maincolor),
                          ),
                          Row(
                            children: [
                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Obx(
                                        () => Text(
                                      DateFormat("yyyy - MM - dd")
                                          .format(
                                          controller1.selectedDate.value)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                child: Icon(Icons.edit),
                                onPressed: () {
                                  controller1.chooseDate();
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
