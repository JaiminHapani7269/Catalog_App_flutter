// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_types_as_parameter_names, deprecated_member_use

import 'package:catalog_app/modal/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxBuilder(
              mutations: const {RemoveMutation},
              builder: (context, MyStore, _) => "\$ ${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make()),
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Sorry!.. These time buying not supported yet"
                            .text
                            .make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                  child: "Buy".text.white.make())
              .w32(context),
        ],
      ).p32(),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show...".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Container(
                    height: 100,
                    width: 60,
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(_cart.items[index].image).p8(),
                  ),
                  trailing: IconButton(
                    onPressed: () => RemoveMutation(item: _cart.items[index]),
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  title: _cart.items[index].name.text.make(),
                  subtitle: "\$ ${_cart.items[index].price}".text.make(),
                ));
  }
}
