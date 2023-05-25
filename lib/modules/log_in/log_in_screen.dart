import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/components/my_text_field.dart';
import 'package:monfy_app/components/log_button.dart';
import 'package:monfy_app/modules/log_in/log_in_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:monfy_app/modules/log_in/register_controller.dart';
import 'package:get/get.dart';




class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  RegisterController controller1 = RegisterController();
  LogInController controller2 = LogInController();
  bool islogin =true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration= Duration(milliseconds: 270);


  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController = AnimationController(vsync: this,duration: animationDuration);
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.1);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize =Tween<double>(begin: size.height*0.1,end: defaultRegisterSize).animate(CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height*0.05,
              right: MediaQuery.of(context).size.width*-0.1,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
          ),
          Positioned(
              top: MediaQuery.of(context).size.height*-0.07,
              left: MediaQuery.of(context).size.width*-0.1,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(200),
                ),
              )
          ),
          AnimatedOpacity(
            opacity: islogin? 0.0 :1.0,
            duration:animationDuration,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: size.width,
                height: size.height*0.07,

                child: IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () {
                    animationController.reverse();
                    setState(() {
                      islogin=!islogin;
                    });
                  },
                  color: kPrimaryColor,

                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: islogin ? 1.0:0.0,
            duration: animationDuration*4,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: defaultLoginSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcom Back",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset('assets/images/login.svg'),
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextField(
                          icon: Icons.email,
                          hint: 'User Name',
                          keyBoard: TextInputType.emailAddress, ontap: (value){
                            controller2.Email=value;
                      },

                      ),

                      MyTextField(
                          icon: Icons.lock,
                          hint: 'Password',
                          keyBoard: TextInputType.text,
                          ontap: (value){
                            controller2.Password=value;
                          },),

                          SwitchListTile(
                        value: controller2.keep,
                        onChanged: (value) {
                            setState(() {
                            controller2.keep = !controller2.keep;
                                      });
                        },
                        title: Text(
                          "                       Remember me",
                          style: TextStyle(
                              color: kPrimaryColor, fontSize: 23),
                        ),
                      ),

                      LogButton(press: (){
                        LogOnClick();
                      }, name: "LOGIN"),

                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (context,child){
              if(viewInset==0 && islogin)
                {
                  return buildRegisterContainer();
                }
              else if(!islogin){
                return buildRegisterContainer();
              }
              return Container();
            },

          ),
          AnimatedOpacity(
            opacity: islogin? 0.0:1.0,
            duration: animationDuration *5,
            child: Visibility(
              visible: !islogin,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                        ),
                        const Text(
                          "Welcom",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                         SvgPicture.asset('assets/images/register.svg'),
                        const SizedBox(
                          height: 1,
                        ),
                        MyTextField(
                            icon: Icons.face,
                            hint: 'First Name',
                            keyBoard: TextInputType.text,
                          ontap: (value){
                              controller1.Name=value;
                          },
                           ),

                        MyTextField(
                            icon: Icons.face,
                            hint: 'Last Name',
                            keyBoard: TextInputType.text,
                          ontap: (value){
                            controller1.LastName=value;
                          },),

                        MyTextField(
                            icon: Icons.email,
                            hint: 'Email',
                            keyBoard: TextInputType.emailAddress
                            ,ontap: (value){
                          controller1.Email=value;
                        },),
                        MyTextField(
                            icon: Icons.lock,
                            hint: 'Password',
                            keyBoard: TextInputType.text
                          ,ontap: (value){controller1.Password=value;},),
                        MyTextField(
                            icon: Icons.lock,
                            hint: 'Confirm Password',
                            keyBoard: TextInputType.text
                          ,ontap: (value){controller1.ConfirmPassword=value;},),

                        LogButton(press: (){
                          registerOnclick();
                        }, name: "SIGN UP"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildRegisterContainer(){
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: kBackgroundColor,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: (){
            animationController.forward();
            setState(() {
              islogin = !islogin;
            });
          },
          child: islogin? const Text(
            "Don't have an account? Sign up",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
            ),
          ):null,
        ),
      ),
    );
  }
  registerOnclick() async {
    EasyLoading.show(status: "Loading..");
    await controller1.RegisterOnClick();

    if (controller1.SignupStatuse==true) {
      EasyLoading.showSuccess('Register Successfully');
      setState(() {
        islogin=!islogin;
      });
       Get.offNamed('/slide');
    }
    else {
      EasyLoading.showError(controller1.message);
      print(controller1.message);
    }
  }
    void LogOnClick() async {
    EasyLoading.show(status: "Loading..");
    await controller2.LogOnClick();
    if (controller2.LoginStatuse) {
    EasyLoading.showSuccess("Welcome");
    Get.offNamed('/home');
  } else {
    EasyLoading.showError("Check email or password");
  }
  }
  }

