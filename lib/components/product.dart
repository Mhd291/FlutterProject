import 'package:flutter/material.dart';
import 'package:monfy_app/config/server_config.dart';
import '../constants.dart';

class Product extends StatelessWidget {

  var name;
  var price;
  var image;

  Product({
    required this.name,
    required this.price,
    required this.image,

});




  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.41,
      width: MediaQuery.of(context).size.width*0.85,
      child: Card(
          child: Column(
          children: [
          Container(
          height: MediaQuery.of(context).size.width*.7,
      width: MediaQuery.of(context).size.width*.9,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey[100]
      ),
      child: Image.network("${Uri.parse(
          ServerConfig.DNS + "/products/" + image)}",fit: BoxFit.cover,)
      ),
      Padding(
      padding: const EdgeInsets.all(8.0),
      child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(
      children: [
      Text(
      'PRICE',
      style: TextStyle(
      color: Colors.grey,
      ),
      ),
      Text(
      price,
      style: TextStyle(
      color: kPrimaryColor,
      fontSize: 25
      ),
      ),
      ],
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
      )
      ),

      ],
      ),
      ),
    );
  }
}
