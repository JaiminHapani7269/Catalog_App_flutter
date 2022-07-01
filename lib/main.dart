import 'package:catalog_app/Screen/cart_page.dart';
import 'package:catalog_app/Screen/homepage.dart';
import 'package:catalog_app/Screen/spash.dart';
import 'package:catalog_app/store/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog App',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: const HomePage(),
      initialRoute: MyRoutes.splashRoute,
      routes: {
        MyRoutes.splashRoute: (context) => const SplashScreen(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
