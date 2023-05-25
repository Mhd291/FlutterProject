import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/modules/add_product/add_product_controller.dart';
import 'package:monfy_app/modules/add_product/category_list.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:csc_picker/csc_picker.dart';

class AddProductPage extends StatelessWidget {
  AddProductController controller = Get.put(AddProductController());
  var currentItem;
  var selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: SizedBox(),),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
            side: BorderSide(
              color: Colors.grey,
            )
        ),
        title: const Text(
          'New Product',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
        actions: [
          MaterialButton(

            onPressed: () async{
              print("hello");
            await  controller.AddProduct();
            if(controller.addpostStatus =true)
            {
              EasyLoading.showSuccess(" Your Product Added");
            }
            else{
              EasyLoading.showError("Your Product Not Added");
            }
            },
            child: Text(
              'Add',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      backgroundImage: controller.userImage,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      controller.UserName + ' ' + controller.UserLastName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'What Kind of Product it is??',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GetBuilder<AddProductController>(
                  init: AddProductController(),
                  builder: (controller) {
                   return Container(
                    height: 224,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Builder(
                      builder: (context) {
                        return CategoryList(
                            currentItem: controller.currentItem,
                            onSelectedItem: (item) {
                              controller.ChangeCategory(item);
                            });
                      },
                    )
                );
              }),
              SizedBox(
                height: 10,
              ),
              CSCPicker(
                onCountryChanged: (value)async{
                  controller.region=value;
                 // controller1.Country=value;
                //  await controller.GetMarket();


                } ,
                showCities: false,
                showStates: false,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.45,
                    child: TextField(
                      onChanged: (value){
                        controller.name = value;
                      },
                      controller: controller.productNameController,
                      decoration: const InputDecoration(
                        labelText: 'Product Name',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 2,
                                color: kPrimaryColor
                            )
                        ),
                      ),
                    )
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width*.40,
                      child: TextField(
                        onChanged: (value)
                        {
                          controller.price=value;
                        },
                        controller: controller.priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                         // suffix: Text('\$'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: kPrimaryColor
                              )
                          ),
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                minLines: 1,
                maxLines: 10,
                onChanged: (value){
                  controller.desc=value;
                },
                controller: controller.textDetailsController,
                decoration: const InputDecoration(
                  labelText: 'Details',
                  hintText: 'Describe your Product ',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 2,
                          color: kPrimaryColor
                      )
                  ),


                ),
              ),
              GetBuilder<AddProductController>(
                init: AddProductController(),
                builder: (controller) =>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(controller.productImage != null)
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 200,
                              child: (controller.productImage != null)
                                  ? Image.file(
                                controller.productImage, fit: BoxFit.fitWidth,)
                                  : const SizedBox.shrink(),
                            ),
                            if(controller.productImage != null)
                              IconButton(
                                  onPressed: () {
                                    controller.DeleteImage();
                                  },
                                  icon: Icon(Icons.cancel,color: Colors.red,)
                              )
                          ],
                        ),

                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                controller.getImage(ImageSource.gallery);
                              },
                              child: Row(
                                children: const [
                                  Icon(Icons.image_outlined),
                                  Text("Choose photo from Gallery")
                                ],
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                controller.getImage(ImageSource.camera);
                              },
                              child: Row(
                                children: const [
                                  Icon(Icons.camera_alt_outlined),
                                  Text("Choose photo from Camera")
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
