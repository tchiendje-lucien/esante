import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash/services/api.dart';
import 'package:wash/services/user_service.dart';
import 'package:wash/sreems/api_response.dart';
import 'Forgot_password.dart';
import 'Register.dart';
import 'Home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';

import 'models/user_model.dart';
//import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String value = "";
  bool _isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = new GlobalKey<FormState>();

  loginUser() async {
    var formData = FormData.fromMap({
      'email': emailController.text,
      'password': emailController.text,
    });
    setState(() {
      _isLoading = true;
    });
    try {
      ApiResponse response = await login(
        emailController.text,
        passwordController.text,
      );
      if (response.error == null) {
        saveAndRedirectHome(response.data as User);
        setState(() {
          _isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${response.error}")));
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  void saveAndRedirectHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", user.token ?? "");
    await pref.setInt("userId", user.id ?? 0);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home_page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Color(0xFF00BCD4),
                    Color(0xFF00BCD4),
                    Color(0xFF00BCD4),
                  ]),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Text(
                        "Bienvenue sur E-Santé",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Se connecter",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Form(
                                key: formkey,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(children: <Widget>[
                                      SingleChildScrollView(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              TextFormField(
                                                  controller: emailController,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  autocorrect: true,
                                                  autofocus: true,
                                                  validator: (val) =>
                                                      val!.isEmpty
                                                          ? "Champs obligatoire"
                                                          : null,
                                                  onSaved: (val) =>
                                                      emailController.text =
                                                          val!,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Email ou Téléphone',
                                                    hintText:
                                                        'Email ou Téléphone ',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    icon: Icon(
                                                      Icons.person,
                                                      color: Colors.blue,
                                                      size: 45,
                                                    ),
                                                  )),
                                              TextFormField(
                                                  controller:
                                                      passwordController,
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  autofocus: true,
                                                  obscureText: true,
                                                  validator: (val) =>
                                                      val!.isEmpty
                                                          ? "Champs obligatoire"
                                                          : null,
                                                  onSaved: (val) =>
                                                      passwordController.text =
                                                          val!,
                                                  decoration: InputDecoration(
                                                    labelText: 'Mot de passe',
                                                    hintText:
                                                        'Entrez votre mot de passe',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    icon: Icon(
                                                      Icons.lock,
                                                      color: Colors.red,
                                                      size: 40,
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              RaisedButton(
                                                onPressed: () {
                                                  if (formkey.currentState!
                                                      .validate()) {
                                                    loginUser();
                                                  }
                                                },
                                                color: Color(0xFF00BCD4),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 50,
                                                    vertical: 10),
                                                splashColor: Colors.grey,
                                                child: Text(
                                                  _isLoading
                                                      ? "Connecting..."
                                                      : "Se connecter",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            loginUser();
                                          }
                                        },
                                        child: Text(
                                          "Avez vous oublié votre mot de passe",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register()),
                                            );
                                          },
                                          child: Text(
                                            "Creer compte",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          )),
                                    ]))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
