// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_types_as_parameter_names
import 'dart:convert';

import 'package:catalog_app/Screen/home_widgets/catalog_list.dart';
import 'package:catalog_app/modal/cart.dart';
import 'package:catalog_app/store/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/modal/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = Uri.parse("https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3");
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(url);
    // final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, MyStore, _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.gray300,
              size: 22,
              count: _cart.items.length,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Catalog App"
              .text
              .xl3
              .bold
              .color(context.theme.accentColor)
              .make(),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MyHeader(),
                "Tranding Products".text.xl2.make(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),
        drawer: const MyDrawer());
  }
}
