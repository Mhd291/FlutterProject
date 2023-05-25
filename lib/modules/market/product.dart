import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:monfy_app/modules/market/product_controller.dart';

import '../../constants.dart';

class DetailsPage extends StatelessWidget {
 ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.29,
                  child: Image.network("${
                      Uri.parse(
                          ServerConfig.DNS + "/products/" + controller.img)
                  }",fit: BoxFit.fill,),
                ),
                IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${controller.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Row(
                      children: [Text(
                        'Region :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: kPrimaryColor
                        ),
                      ),
                        SizedBox(height: 20,),
                        Text(
                         "${controller.region}",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),],),

                    SizedBox(height: 20,),
                    Text(
                      'Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: kPrimaryColor
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "${controller.details}",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                              'PRICE',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${controller.price}",
                              style: TextStyle(
                                  color:kPrimaryColor,
                                  fontSize: 25
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: (){},
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(30)
                            ),
                            color: kPrimaryColor,
                          ),
                          child: const Center(
                              child:Icon(Icons.chat_outlined,color: Colors.white,)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
