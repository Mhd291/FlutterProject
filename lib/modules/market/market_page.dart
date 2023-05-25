import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/components/category.dart';
import 'package:monfy_app/components/product.dart';
import 'package:monfy_app/modules/market/market_controller.dart';
import 'package:csc_picker/csc_picker.dart';
//import 'package:project1/modules/market/categories_item.dart';

import '../../constants.dart';
import 'category_controller.dart';

class Market extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    CartegoryController controller1 = CartegoryController();
    MarketController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Monfy Market"),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed('/add_product');
          }, icon: Icon
            (Icons.add)),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children:[

            CSCPicker(
                onCountryChanged: (value)async{
                  controller.Countryy.value=value;
                  controller1.Country=value;
                 await controller.GetMarket();


                } ,
                showCities: false,
                showStates: false,
              ),


               Obx((){

                if (controller.isloading.isTrue) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                      strokeWidth: 11,
                    ),
                  );
                }
                else if(controller.Countryy.value=="all") {
                  return Padding(
                    padding: const EdgeInsets.only(top:200,left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                                children: [
                                  Row(
                                      children:
                                      List.generate(controller.Category.length, (index) {

                                        return Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            InkWell(
                                              child: CategoryItem(controller.Category[index].name,
                                                  "kn vlwke flke f"),
                                              onTap: () async{
                                                print(controller.Countryy.value);
                                                Get.toNamed('/cat',
                                                    arguments: {
                                                      "id":controller.Category[index].id,
                                                      "name":"${controller.Category[index].name}",
                                                      "country":"${controller.Countryy.value}",
                                                    });
                                              },
                                            ),
                                          ],
                                        );
                                      })),

                                ]
                            ),
                          ),
                        ),

                        const Text(
                          'Products',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          child:  Container(

                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child:
                              Column(
                                  children:
                                  List.generate(controller.Product.length, (index) {

                                    return Column(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        InkWell(
                                          child: Product(price:"${controller.Product[index].price}" ,
                                            image: "${controller.Product[index].imgName}",
                                            name:  "${controller.Product[index].name}",),
                                          onTap: () async{
                                            Get.toNamed('/product',arguments: {
                                              'name': '${controller.Product[index].name}',
                                              'region': '${controller.Product[index].region}',
                                              'price': '${controller.Product[index].price}',
                                              'img': '${controller.Product[index].imgName}',
                                              'dec': '${controller.Product[index].description}',

                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 19,
                                        ),
                                      ],
                                    );
                                  })),


                            ),

                          ),
                        )
                      ],
                    ),
                  );
                }
                else{
                  return Padding(
                    padding: const EdgeInsets.only(top:200,left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                                children: [
                                  Row(
                                      children:
                                      List.generate(controller.Category.length, (index) {

                                        return Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            InkWell(
                                              child: CategoryItem(controller.Category[index].name,
                                                  "kn vlwke flke f"),
                                              onTap: () async{
                                                Get.toNamed('/cat',
                                                    arguments: {
                                                      "id":controller.Category[index].id,
                                                      "name":"${controller.Category[index].name}",
                                                      "country":"${controller.Countryy.value}",
                                                    });
                                              },
                                            ),
                                          ],
                                        );
                                      })),

                                ]
                            ),
                          ),
                        ),

                        const Text(
                          'Products',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          child:  Container(

                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child:
                              Column(
                                  children:
                                  List.generate(controller.Product.length, (index) {

                                    return Column(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        ('${controller.Product[index].region}'==controller.Countryy.value)?InkWell(
                                          child: Product(price:"${controller.Product[index].price}" ,
                                            image: "${controller.Product[index].imgName}",
                                            name:  "${controller.Product[index].name}",),
                                          onTap: () async{
                                            Get.toNamed('/product',arguments: {
                                              'name': '${controller.Product[index].name}',
                                              'region': '${controller.Product[index].region}',
                                              'price': '${controller.Product[index].price}',
                                              'img': '${controller.Product[index].imgName}',
                                              'dec': '${controller.Product[index].description}',

                                            });
                                          },
                                        ):Container(),
                                        const SizedBox(
                                          height: 19,
                                        ),
                                      ],
                                    );
                                  })),


                            ),

                          ),
                        )
                      ],
                    ),
                  );
                }
              }),

          ]
        )      ),
    );
  }
}
