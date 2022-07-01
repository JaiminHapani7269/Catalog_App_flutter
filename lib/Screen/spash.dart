// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, MyRoutes.homeRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: context.canvasColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: context.cardColor,
                      radius: 50.0,
                      child: Icon(
                        CupertinoIcons.cart,
                        color: context.theme.accentColor,
                        size: 50.0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    "Catalog App"
                        .text
                        .xl5
                        .bold
                        .color(context.theme.accentColor)
                        .make(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
