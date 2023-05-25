import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: Colors.indigo,
        onPressed: ()=>
            ZoomDrawer.of(context)!.toggle(),
            icon:const Icon( Icons.menu)
    );
  }
}