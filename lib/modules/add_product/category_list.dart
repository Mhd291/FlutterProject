import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monfy_app/constants.dart';
import 'category_item.dart';

class Categories{
  static const Clothes=CategoryItem('Clothes',Icons.shopping_bag_outlined,'1');
  static const Devices=CategoryItem('Devices',Icons.devices,'2');
  static const Cars=CategoryItem('Cars',Icons.car_repair,'3');
  static const Buildings=CategoryItem('Buildings',Icons.public,'3');
  static const all = <CategoryItem>[
    Clothes,
    Devices,
    Cars,
    Buildings
  ];




}

class CategoryList extends StatelessWidget {
  final CategoryItem currentItem;
  final ValueChanged<CategoryItem>onSelectedItem;

  const CategoryList({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
        children: <Widget>[
          ...Categories.all.map(buildMenuItem).toList(),

        ],
      ) ,
    ),
  );

  Widget buildMenuItem(CategoryItem item)=> ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
      tileColor: Colors.white,
      selectedTileColor: kPrimaryColor,
      selected: currentItem==item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: ()=>onSelectedItem(item),
    ),
  );
}

