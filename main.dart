import 'package:flutter/material.dart';
import 'package:flutter_codepurlearn/core/store.dart';

import 'package:flutter_codepurlearn/pages/home_page.dart';
import 'package:flutter_codepurlearn/pages/login_page.dart';
import "package:flutter_codepurlearn/utills/routes.dart";
import "package:flutter_codepurlearn/widgets/theme.dart";
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

import 'pages/home_details_page.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        routeInformationParser: VxInformationParser(),
        routerDelegate: VxNavigator(routes: {
          "/": (_, __) => const MaterialPage(child: LoginPage()),
          MyRoutes.loginRoute: (_, __) =>
              const MaterialPage(child: LoginPage()),
          MyRoutes.homeRoute: (_, __) => const MaterialPage(child: HomePage()),
          MyRoutes.homeDetailsRoute: (_, params) =>
              MaterialPage(child: HomeDetailPage(catalog: params))
        })
        // initialRoute: MyRoutes.homeRoute,
        /* routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
      },*/
        );
  }
}
