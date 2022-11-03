import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogPrice extends StatelessWidget {
  final int price;
  const CatalogPrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return "\$$price".text.red800.bold.xl.make();
  }
}
