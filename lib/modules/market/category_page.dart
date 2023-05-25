import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monfy_app/components/category.dart';
import 'package:monfy_app/components/product.dart';
import 'package:monfy_app/modules/market/market_controller.dart';
//import 'package:project1/modules/market/categories_item.dart';

import '../../constants.dart';
import 'category_controller.dart';

class CategoryPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    CartegoryController controller = Get.put(CartegoryController());

    return Scaffold(

      body: SafeArea(

          child:

           Stack(
             children: [
               Positioned(
                 top: 20,
                 child: Row(
                 children:[ Container(
                   width: MediaQuery.of(context).size.width*0.8,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(45),
                       color: Colors.grey[200]
                   ),
                   child:  TextField(

                     decoration: InputDecoration(
                         border: InputBorder.none,
                         prefixIcon: Icon(Icons.search)


                     ),
                     onChanged: (value){
                       controller.search=value;
                     },
                   ),
                 ),
                   IconButton(onPressed: ()async{
                     await controller.onSearch();
                   },
                       icon: Icon(Icons.search))
                 ],
               ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
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
                   else if(controller.Country=="all") {
                     return Padding(
                       padding: const EdgeInsets.only(top:100,left: 20,right: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           const SizedBox(height: 10,),
                           Text(
                             "${controller.name}",
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
                                 child: Column(
                                     children: [
                                       Column(
                                           children:
                                           List.generate(controller.Product.length, (index) {

                                             if(controller.search=="all")
                                             {
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
                                                 ],
                                               );
                                             }
                                             else {
                                               return Column(
                                                 children: [
                                                   const SizedBox(
                                                     width: 15,
                                                   ),
                                                   (controller.search=="${controller.Product[index].name}")?
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
                                                   ):Container(),
                                                 ],
                                               );
                                             }
                                           })),

                                     ]
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                     );
                   }
                   else{
                     return Padding(
                       padding: const EdgeInsets.only(top:100,left: 20,right: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           const SizedBox(height: 10,),
                           Text(
                             "${controller.name}",
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
                                 child: Column(
                                     children: [
                                       Column(
                                           children:
                                           List.generate(controller.Product.length, (index) {

                                             if(controller.search=="all")
                                             {
                                               return Column(
                                                 children: [
                                                   const SizedBox(
                                                     width: 15,
                                                   ),
                                                   ('${controller.Product[index].region}'==controller.Country)?InkWell(
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
                                                 ],
                                               );
                                             }
                                             else {
                                               return Column(
                                                 children: [
                                                   const SizedBox(
                                                     width: 15,
                                                   ),
                                                   (controller.search=="${controller.Product[index].name}"
                                                   && '${controller.Product[index].region}'==controller.Country
                                                   )?
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
                                                   ):Container(),
                                                 ],
                                               );
                                             }
                                           })),

                                     ]
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                     );
                   }
                 }),

             ],
           )  ),
    );
  }
}
