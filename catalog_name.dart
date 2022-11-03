import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogName extends StatelessWidget {
  final String name;

  const CatalogName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return name.text.bold.lg.color(context.accentColor).make();
  }
}
