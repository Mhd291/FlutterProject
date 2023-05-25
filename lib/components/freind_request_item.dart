import 'package:flutter/material.dart';

import '../constants.dart';

class FriendRequestItem extends StatelessWidget {
  final Image img;
  final String name;
  final String lastname;
  final String job;
  final Function() accept;
  final Function() deny;


  FriendRequestItem({
    required this.img,
    required this.name,
    required this.lastname,
    required this.job,
    required this.accept,
    required this.deny,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
      Container(decoration: const BoxDecoration(
      color: Colors.grey,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(35)),
      ), height: 152,),
    Container(
    //height: MediaQuery.of(context).size.height*0.15,
    height: 150,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
    ),
    child:Row(
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Stack(
    alignment: Alignment.center,
    children: [
    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    ),
    width: 100,
    height: 100,
    ),
    SizedBox(
    width: 100,
    height: 100,
    child:Container(
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width*0.3,
      child: ClipOval(
        child: img,
      ),
    ),
    ),
    ],
    ),
    ],
    ),
    const SizedBox(width: 10,),
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    name+' '+lastname,
    style: const TextStyle(
    fontSize:22,
    fontWeight: FontWeight.bold
    ),
    ),
    Text(
    job,
    style: const TextStyle(
    color: Colors.grey
    ),
    ),
    Row(
    children:
    [
    MaterialButton(


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
    child: Text(
    'Accept',
    style: TextStyle
    (color: Colors.white),
    )
    ),
    ),
      onPressed: accept,
    ),

    MaterialButton(
    onPressed: deny,
    child: Container(
    width: 100,
    height: 40,
    decoration: BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(30),
    topRight: Radius.circular(30)
    ),

    ),
    child: const Center(
    child: Text(
    'Cancel',
    style: TextStyle
    (color: kPrimaryColor),
    )
    ),
    ),
    )
    ],
    )
    ],
    )
    ],
    )
    )
    ,
    ]
    ,
    )
    ,
    );
  }
}
