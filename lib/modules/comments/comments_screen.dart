import 'package:flutter/material.dart';
import 'package:monfy_app/components/comment.dart';
import 'package:monfy_app/components/recorder.dart';
import 'package:monfy_app/constants.dart';
import 'package:monfy_app/modules/comments/comments_controller.dart';
import 'package:get/get.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';






class CommentsScreen extends StatelessWidget {




  //////////////////////////////////
  CommentController controller = Get.put(CommentController());
  final fieldText =TextEditingController();
  void clearText(){
    fieldText.clear();
  }
  var s;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comments"),
      backgroundColor: kPrimaryColor,),
      body: Obx(() {
        if (controller.isloading.isTrue) {
            return Center(
              child: const CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          } 
          else{
            return Stack(children: [
        Positioned(
          right: 0,
          child :Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height*0.81,
          width: MediaQuery.of(context).size.width,
           child: SingleChildScrollView(
             reverse: true,
             child: Column(children: List.generate(controller.Comments.length, (index){
              return Comment_item(body: "${controller.Comments[index].value}",
               image: "${controller.Comments[index].fileComment}",
               name: "${controller.Comments[index].name}", lastName:"${controller.Comments[index].name}", userimage: Image.network("${Uri.parse(ServerConfig.DNS + "/"+"${controller.Comments[index].profilePhotoPath}"+"/" + "${controller.Comments[index].profilePhoto}")}")
               ,play: ()async{
                   //print("${Uri.parse(ServerConfig.DNS + "https://192.168.30.233:8000/comments/" + "${controller.Comments[index].fileComment}")}");
                 await controller.audioPlayer.setUrl("${Uri.parse("http://192.168.114.233:8000/comments/" + "${controller.Comments[index].fileComment}")}");
                 await controller.audioPlayer.play("${Uri.parse("http://192.168.114.233:8000/comments/" + "${controller.Comments[index].fileComment}")}");
                 Get.defaultDialog(
                                      title: 'Options',
                                      content:Column(
                                        children: [
                                          Slider(
                                            min: 0,
                                            max: controller.duration.inSeconds.toDouble(),
                                            value: controller.position.inSeconds.toDouble(),
                                           onChanged: (value)async{
                                              final position = Duration(seconds: value.toInt());
                                              await controller.audioPlayer.seek(position);


                                              await controller.audioPlayer.resume();
                                           }),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(formatTime(controller.position)),
                                          Text(formatTime(controller.duration - controller.position)),
                                            ],
                                          ),
                                          CircleAvatar(
                                            radius: 22,
                                           // child:
                                          ),
                                        ],
                                      ),
                                      textCancel: "Cancel",
                                      cancelTextColor:Colors.white,
                                      buttonColor: kPrimaryColor,
                                    );     
               }, isMine: (controller.Comments[index].isMyComment !=1)?false:true,
                date:controller.Comments[index].createdAt, delete: (){
                  controller.DeleteComment(controller.Comments[index].id);
                },
                );
            
             }),),
           ),
        ),),
        
        Positioned(bottom: 5,
        
        child: Container( 
        color:kBackgroundColor,
        
        width: MediaQuery.of(context).size.width,
        child: Column(children: [

          Row(children: [
             SizedBox(
              width: MediaQuery.of(context).size.width*0.02,
            ),

         IconButton(onPressed: ()async{
      controller.isRecording(!controller.isRecording.value);
           await controller.recorder.toggleRecording();


            },

              icon: Icon((controller.isRecording.isTrue)?Icons.stop:Icons.mic)),
            IconButton(onPressed: (){
              controller.getImage(ImageSource.gallery);

             // Get.back();
            }, icon: Icon(Icons.image),),
           
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              padding: EdgeInsets.symmetric(horizontal:5 ),
              child:TextFormField(
                controller:fieldText ,
                onChanged: (value){
                  controller.str="${value}";

                },

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon :IconButton(icon:Icon(Icons.send,color: kPrimaryColor,),onPressed: ()async{
                    if(controller.isloadingComments.isTrue)
                      {
                        EasyLoading.show(status: "Loading");
                      }

                    await controller.AddComment();
                     clearText();

                  //  await controller.GetComments1();
                  },),
                  contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                   
                  )
                ),
              ),
              width: MediaQuery.of(context).size.width*0.8,
            ),
            
          ],),
          
        
       ],),
        ))
      ],);
          }
      })
    );
  }
  String formatTime(Duration duration){
    String twoDigits(int n )=> n.toString().padLeft(2,'0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return[
      if (duration.inHours >0) hours,minutes,seconds,
    ].join(':');
  }
}