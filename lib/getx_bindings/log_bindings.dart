import 'package:get/get.dart';
import 'package:monfy_app/modules/log_in/log_in_controller.dart';
import 'package:monfy_app/modules/log_in/register_controller.dart';



class LogBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<LogInController>(LogInController());
    Get.put<RegisterController>(RegisterController());
  }


}