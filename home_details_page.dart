import 'package:flutter/material.dart';
import 'package:flutter_codepurlearn/models/catalog.dart';
import 'package:flutter_codepurlearn/pages/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_desc.dart';
import 'home_widgets/catalog_name.dart';
import 'home_widgets/catalog_price.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
            color: context.cardColor,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                CatalogPrice(price: catalog.price).scale150(),
                AddToCart(catalog: catalog).wh(120, 50)
              ],
            ).p32()),
        body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Hero(
                        tag: Key(catalog.id.toString()),
                        child: Image.network(catalog.image))
                    .h32(context),
                Expanded(
                    child: VxArc(
                        height: 30.0,
                        arcType: VxArcType.CONVEY,
                        edge: VxEdge.TOP,
                        child: Container(
                          color: context.cardColor,
                          width: context.screenWidth,
                          child: Column(
                            children: [
                              CatalogName(name: catalog.name).scale200(),
                              10.heightBox,
                              CatalogDesc(desc: catalog.desc).scale150(),
                              10.heightBox,
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate."
                                  .text
                                  .textStyle(context.captionStyle)
                                  .make()
                                  .p16()
                            ],
                          ).py64(),
                        )))
              ],
            )));
  }
}
