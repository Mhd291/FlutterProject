import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:monfy_app/components/slide_button.dart';
import 'package:get/get.dart';
import 'package:monfy_app/constants.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:monfy_app/modules/intro_slider/intro_slider_controller.dart';
import 'package:intl/intl.dart';
import 'package:expandable/expandable.dart';
import 'package:monfy_app/components/gender_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class IntroSlider extends StatelessWidget {
IntroController controller = Get.put(IntroController(),permanent: true);
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(

          title: 'Welcome to MONFY',
          body: "Let's do some Steps...",

          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Step 1',
         // body: "Let's answer some information.. ",
          bodyWidget: Column(
            children: [

              Text("Choose your Gender",style: TextStyle(fontSize: 30,color: Colors.black),),
              SizedBox(height: MediaQuery.of(context).size.height*0.24,),
              Genderwidget(ontap: (value){
                controller.Gender= "${value}";
              })

            ],
          ),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          title: 'Step 2',
          bodyWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add your Birthday",style: TextStyle(fontSize: 30,color: Colors.black),),

                SizedBox(height: MediaQuery.of(context).size.height*0.24,),

                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,),

                  child:Center(
                    child: Obx(
                          () => Text(
                        DateFormat("yyyy - MM - dd")
                            .format(controller.selectedDate.value)
                            .toString(),
                        style: TextStyle(fontSize: 35,color: kBackgroundColor),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                GestureDetector(
                  onTap: () {
                  controller.chooseDate();
                },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.05,
                       width: MediaQuery.of(context).size.width*0.3,
                       decoration: BoxDecoration(color: Colors.blue,
                          borderRadius:BorderRadius.circular(30) ,
                       ),
                    child: Center(child: Text('Select Date',style: TextStyle(color: kBackgroundColor,fontSize: 20),),)
                  ),
                ),
              ],
            ),
          ),


          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Step 3',
          // body: "Let's answer some information.. ",
          bodyWidget: Column(
            children: [

              Text("What do you work ?",style: TextStyle(fontSize: 30,color: Colors.black),),
              SizedBox(height: MediaQuery.of(context).size.height*0.24,),
          GetBuilder<IntroController>(
              init: IntroController(),
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  hasIcon: false,
                                  tapHeaderToExpand: false,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                ),
                                header: CheckboxListTile(
                                  title:const Text("I have a job",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,color: kPrimaryColor)
                                              ),
                                  value: controller.checked.value,
                                  onChanged: (value) {
                                    controller.checked.value = value!;
                                    controller.change();
                                    controller.expandController.toggle();
                                  },
                                ),
                                controller:controller.checked.value?controller.expandController:null,
                                collapsed:const SizedBox.shrink(),
                                expanded: TextField(
                                  onChanged: (value){
                                    print(value);
                                    controller.Jop=value;
                                  },
                                  decoration:const InputDecoration(
                                      hintText: 'What is your job'
                                  ),
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: ExpandablePanel(
                                theme:const ExpandableThemeData(
                                  hasIcon: false,
                                  tapHeaderToExpand: false,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                ),
                                header: CheckboxListTile(
                                  title: const Text("I am studying",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,
                                      color: kPrimaryColor)),
                                  value: controller.isStudying.value,
                                  onChanged: (value) {
                                    controller.isStudying.value = value!;
                                    controller.change();
                                    controller.expandController1.toggle();
                                  },
                                ),
                                controller:controller.isStudying.value?controller.expandController1:null,
                                collapsed:const SizedBox.shrink(),
                                expanded: TextField(
                                  onChanged: (value){
                                    controller.Study=value;
                                  },
                                  decoration:const InputDecoration(
                                      hintText: 'What are you Studying?'
                                  ),
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
          ),

            ],
          ),
          decoration: getPageDecoration(),
        ),

        PageViewModel(

          title: 'Welcome again to MONFY',
          body: "Let's start to use the application",
          decoration: getPageDecoration(),

        ),
      ],
      done: Text('Start', style: TextStyle(color:kPrimaryColor,fontWeight: FontWeight.w600)),
      onDone: () {
        SetOnClick();
      },
      showSkipButton: true,
      skip: Text('Skip',style: TextStyle(color: kPrimaryColor),),
      onSkip: () => Get.offNamed('/home'),
      next: Icon(Icons.arrow_forward,color: kPrimaryColor,),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: kBackgroundColor,
      skipFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );





  DotsDecorator getDotDecoration() => DotsDecorator(
    color: kPrimaryColor,
    //activeColor: Colors.orange,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 35,color: kPrimaryColor ,fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: kBackgroundColor,
  );
   void SetOnClick() async {
     EasyLoading.show(status: "Loading..");
     await controller.SetInfo();
  if (controller.SetStatuse) {
    EasyLoading.showSuccess("Welcome");
    Get.offNamed('/home');
  } else {
    EasyLoading.showError("Error");
  }
}
}

