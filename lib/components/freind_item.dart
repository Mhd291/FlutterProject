

import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
  final Image img;
  final String name;
  final String lastname;
  final String job;
  final String study;
  final Function() ontap;


  FriendItem(
  {
    required this.img,
    required this.name,
    required this.lastname,
    required this.job,
    required this.study,
    required this.ontap,
}
      );

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
            ),height: 112,),
            InkWell(
              onTap: ontap,
              child: Container(
                //height: MediaQuery.of(context).size.height*0.15,
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40)),
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
                                child: Container(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name+' '+lastname,
                            style: const TextStyle(
                                fontSize:22,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            job,
                            style: const TextStyle(
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            study,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey
                            ),
                          )

                        ],
                      ),
                      const SizedBox(width: 10,),


                    ],
                  )
              ),
            ),
          ],
        ),
      );

  }
}
