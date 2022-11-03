import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogDesc extends StatelessWidget {
  final String desc;
  const CatalogDesc({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return desc.text.textStyle(context.captionStyle).make();
  }
}
