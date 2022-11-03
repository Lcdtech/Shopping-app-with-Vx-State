import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: unused_import
import '../../widgets/theme.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Catalog App".text.xl4.bold.color(context.theme.accentColor).make(),
        "Trending products".text.xl.make(),
      ],
    );
  }
}
