import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_codepurlearn/core/store.dart';
import 'package:flutter_codepurlearn/models/cart.dart';
import "dart:convert";
import 'package:flutter_codepurlearn/models/catalog.dart';
import 'package:flutter_codepurlearn/pages/cart_page.dart';
// ignore: unused_import
import 'package:flutter_codepurlearn/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/catalog.json");

    // for http
    // url define above
    // response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (ctx, onPressed, _) => FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const CartPage())));
                  },
                  // ignore: deprecated_member_use
                  backgroundColor: context.theme.buttonColor,
                  child: const Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                  ))
              .badge(
                  size: 21,
                  textStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  color: Vx.red500,
                  count: cart.items.length)),
      body: SafeArea(
          child: Container(
              padding: Vx.m24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  // ignore: unnecessary_null_comparison
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    const CatalogList().py16().expand()
                  else
                    const CircularProgressIndicator().centered().expand()
                ],
              ))),
    );
  }
}
