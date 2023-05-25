import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu_item.dart';

class MenuItems{
  static const home=MenuItem('Home',Icons.home);
  static const allusers=MenuItem('All Users',Icons.group_outlined);
  static const notification=MenuItem('notification',Icons.doorbell);
  static const settigs=MenuItem('Settings',Icons.settings);
  static const all = <MenuItem>[
    home,
    allusers,
    notification,
    settigs
  ];




}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem>onSelectedItem;

  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Theme(
    data: ThemeData.dark(),
    child: Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(flex: 2),
          ],
        ) ,
      ),
    ),
  );

  Widget buildMenuItem(MenuItem item)=> ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: currentItem==item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: ()=>onSelectedItem(item),
    ),
  );
}

