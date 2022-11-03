import 'package:flutter/material.dart';
import "package:flutter_codepurlearn/utills/routes.dart";
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await context.vxNav.push(Uri.parse(MyRoutes.homeRoute));
      //  await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/undraw_hey_email_liaa.png",
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Welcome $name",
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Enter Username",
                                      labelText: "Username"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Username Cannot be Empty";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    name = value;
                                    setState(() {});
                                  },
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Password",
                                      labelText: "Password"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password Cannot be Empty";
                                    } else if (value.length < 6) {
                                      return "Password Length Shold be atleast 6";
                                    } else if (!value.contains("@")) {
                                      return "Password Length Shold be atleast 6 with write @";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Material(
                                    // ignore: deprecated_member_use
                                    color: context.theme.buttonColor,
                                    borderRadius: BorderRadius.circular(
                                        changeButton ? 50 : 10),
                                    child: InkWell(
                                      onTap: () => moveToHome(context),
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        height: 50,
                                        width: changeButton ? 50 : 150,
                                        // ignore: sort_child_properties_last
                                        child: Center(
                                          child: changeButton
                                              ? const Icon(Icons.done,
                                                  color: Colors.white)
                                              : const Text("Login",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18)),
                                        ),
                                      ),
                                    ))
                                /*ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.homeRoute);
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text(
                                    "Login",
                                  ),
                                  style: TextButton.styleFrom(
                                      minimumSize: const Size(150, 40)))*/
                              ],
                            ))
                      ],
                    )))));
  }
}
