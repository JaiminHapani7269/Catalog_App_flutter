// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'package:catalog_app/Screen/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../modal/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Sea justo et sit dolore sit. Eos voluptua dolore elitr kasd et. Sadipscing amet et clita takimata et et et accusam vero, amet clita rebum dolor takimata dolor voluptua accusam lorem. Dolor at diam et lorem sit elitr lorem, rebum invidunt amet ea kasd sea amet, gubergren diam dolore no."
                          .text
                          .lg
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$ ${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(150, 50)
          ],
        ).p24(),
      ),
    );
  }
}
