import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import 'add_post_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AddPostScreen extends StatelessWidget {
  AddPostController controller=Get.put(AddPostController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        bottom: const PreferredSize(preferredSize: Size.fromHeight(40), child:SizedBox(),),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
            side: BorderSide(
              color: Colors.grey,
            )
        ),
        title: const Text(
          'New Post',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: ()async{

              if("${controller.textPostController}" != "")
                {EasyLoading.show(status: "Loading..");
                if(controller.video == null && controller.image == null)
                {
                  await controller.AddPost2();
                }
                else if(controller.image == null)
                {
                  await controller.AddPost(controller.video!);
                }
                else
                  {
                    await controller.AddPost(controller.image!);
                  }
                }
               if(controller.addpostStatus =true)
                 {
                   EasyLoading.showSuccess("Post Added");
                 }
               else{
                 EasyLoading.showError("Post Not Added");
               }
                },
            child: Text('Post',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      backgroundImage: controller.userImage,
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      controller.UserName+' '+controller.UserLastName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                minLines: 5,
                maxLines: 10,
                onChanged:(value){
                  controller.str=value;
                },
                controller: controller.textPostController,
                decoration: InputDecoration(
                  hintText: 'What is on your mind ?',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 2,
                          color: kPrimaryColor
                      )
                  ),


                ),
              ),
              GetBuilder<AddPostController>(
                init: AddPostController(),
                builder: (controller)=>Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child:  (controller.image != null)?Image.file(controller.image!,fit: BoxFit.fitWidth,):const SizedBox.shrink(),
                        ),
                        if(controller.image!=null)
                          IconButton(
                              onPressed: (){
                                controller.DeleteImage();
                              },
                              icon: Icon(Icons.cancel)
                          )
                      ],
                    ),
                    Column(

                      children: [
                        MaterialButton(
                          onPressed:(){
                            controller.getVideo();
                            Get.back();
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.video_camera_back),
                              Text("Choose Video from Gallery")
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed:(){
                            controller.getImage(ImageSource.gallery);
                            Get.back();
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.image_outlined),
                              Text("Choose photo from Gallery")
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed:(){
                            controller.getImage(ImageSource.camera);
                            Get.back();
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
