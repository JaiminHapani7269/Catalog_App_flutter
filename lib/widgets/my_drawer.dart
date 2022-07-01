// ignore_for_file: deprecated_member_use

import 'package:catalog_app/Screen/cart_page.dart';
import 'package:catalog_app/Screen/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Jaimin Hapani"),
                accountEmail: Text("jaiminhapani7787@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/jaimin.jpeg'),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              leading: Icon(
                Icons.home,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: context.theme.accentColor,
              ),
              title: Text(
                "My Account",
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bag,
                color: context.theme.accentColor,
              ),
              title: Text(
                "My Orders",
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage())),
              leading: Icon(
                CupertinoIcons.shopping_cart,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Cart",
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.password,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Chnage Password",
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: context.theme.accentColor,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
