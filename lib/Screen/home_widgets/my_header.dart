// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Tranding Products".text.xl2.make(),
      ],
    );
  }
}
