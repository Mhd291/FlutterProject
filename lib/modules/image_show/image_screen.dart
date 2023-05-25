import 'package:flutter/material.dart';
import 'package:monfy_app/modules/image_show/image_controller.dart';
import 'package:get/get.dart';
import 'package:monfy_app/config/server_config.dart';
class Imager extends StatelessWidget {

ImageController controller =Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network("${Uri.parse(
          ServerConfig.DNS + "/posts/" + controller.image)}") ,
    );
  }
}
