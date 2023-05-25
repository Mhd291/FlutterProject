import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monfy_app/constants.dart';
import 'package:readmore/readmore.dart';
import 'package:monfy_app/config/server_config.dart';
import 'package:mime/mime.dart';
import 'package:intl/intl.dart';




class Comment_item extends StatelessWidget {




  //////////////////////////////////
   var url;
   String body;
   String name;
   String lastName;
   Image userimage;
   bool isMine;
   var date;
   var image;
   final Function() play;
   final Function() delete;



   
    Comment_item({
    
    
    required this.body,
    required this.name,
    required this.lastName,
    required this.userimage,
    required this.image,
    required this.play,
    required this.date,
    required this.isMine,
      required this.delete,


   });
  @override
  Widget build(BuildContext context) {
    return Column(children:[
      SizedBox(
      height: MediaQuery.of(context).size.height*0.03,
    ),
     Padding (
      padding:  EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width*0.025,0,
          MediaQuery.of(context).size.width*0.1 , 0),
      
      child:Container(
     decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[200],
      ),
      
       child:GestureDetector(
              onLongPress: (){
               if (isMine == true)
                 {
                   Get.defaultDialog(
                     title: 'Options',
                     content:GestureDetector(
                       onTap: delete,
                       child: Container(
                         child: Row(
                           children: [
                            Icon(Icons.delete),
                             Text("Delete Comment"),
                           ],
                         ),
                       ),
                     ),
                     textCancel: "Cancel",
                     cancelTextColor: kBackgroundColor,
                     buttonColor: kPrimaryColor,
                   );
                 }
              },
         child: ListTile(
          leading: Container(
            height: MediaQuery.of(context).size.height*0.06,
            width:MediaQuery.of(context).size.width*0.13,
            child: ClipOval(child:userimage),
          ),
          title: Text(name+" "+lastName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          subtitle: buildText(body),
          ),
       ),
    ),),
    Column(children: [
      SizedBox(height:MediaQuery.of(context).size.height*0.005 ,),
      Row(
        children: [
          SizedBox(width:MediaQuery.of(context).size.width*0.7 ,),
           DateFormat('dd-MM-yyyy').format(date!) ==
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.now())
                                    ? Text(
                                  DateFormat('hh:mm a').format(date!),
                                  style: const TextStyle(color: Colors.grey),
                                )
                                    : Text(
                                    DateFormat('dd/MM/yyyy ').format(date!),
                                    style: const TextStyle(color: Colors.grey))

        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.02),
        child:Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

         child: (image !="null")?Container(

           child: (lookupMimeType(image)!.split('/').first != "image")?Container(
               child: Row(
                 children: [
                   IconButton(onPressed: play, icon: Icon(Icons.play_arrow)),
                   Text("Voice Comment"),
                   Icon(Icons.ring_volume),
                 ],
               ),
           ):Container(

             // height: MediaQuery.of(context).size.height*0.08,
             // width: MediaQuery.of(context).size.width*0.12,
               child:Image.network("${Uri.parse(ServerConfig.DNS + "/comments/" + image)}",
                 height: MediaQuery.of(context).size.height*0.19,
                 width: MediaQuery.of(context).size.width*0.5,
               )

           ),
         ):null,
          // MyAudio(url: url, isPlaying: isPlaying, onpress: onpress, duration: duration,position: position, slide:slide,),

      ),
      )
    ],)
    ]);

  }

}

 Widget buildText(String text) {
    final styleButton = TextStyle(
      fontSize: 20,
      color: kPrimaryColor,
      fontWeight: FontWeight.bold
    );

    return ReadMoreText(
      text, 
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: "Read More",
      trimExpandedText: "Read Less",
      lessStyle: styleButton ,
      moreStyle: styleButton,
      style: const TextStyle( fontSize: 20),
    );
  }
