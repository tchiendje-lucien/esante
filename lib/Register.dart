import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wash/Services/api.dart';
import 'package:wash/services/api.dart';
import 'package:wash/services/user_service.dart';
import 'package:wash/sreems/api_response.dart';
import 'Constant.dart';
import 'Forgot_password.dart';
import 'LoginPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool value_radio = false;
  int val = -1;
  String value = "";
  String date_birth = "";
  bool _isLoading = false;
  var body;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();
  TextEditingController re_passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formkey = new GlobalKey<FormState>();
  // Initial Selected Value
  String sexe = 'Homme';
  // List of items in our dropdown menu
  var items = ['Homme', 'Femme'];
  String date = "";
  DateTime selectedDate = DateTime.now();

  registerUser() async {
    var formData = {
      'email': emailController.text,
      'password': passwordController.text,
      're_password': re_passwordController.text,
      'phone': phoneController.text,
      'name': nameController.text,
      'surname': surnameController.text,
      'date_birth': date_birth,
      'sexe': sexe,
    };
    /*if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      formkey.currentState!.reset();
    }*/
    setState(() {
      _isLoading = true;
    });
    try {
      ApiResponse response = await register(
          emailController.text,
          passwordController.text,
          nameController.text,
          surnameController.text,
          sexe,
          phoneController.text,
          re_passwordController.text,
          date_birth);
      print(emailController.text);
      if (response.error == null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${response.error}")));
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
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
                    "Bienvenu sur E-Santé",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Inscription",
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
                      child: SingleChildScrollView(
                          child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 7,
                                ),
                                Form(
                                  key: formkey,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                            controller: nameController,
                                            keyboardType: TextInputType.text,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.isEmpty
                                                ? "Champs obligatoire"
                                                : null,
                                            onSaved: (val) =>
                                                nameController.text = val!,
                                            decoration: kInputDecoration(
                                                "Nom", "Entrez votre nom")),
                                        TextFormField(
                                            controller: surnameController,
                                            keyboardType: TextInputType.text,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.isEmpty
                                                ? "Champs obligatoire"
                                                : null,
                                            onSaved: (val) =>
                                                surnameController.text = val!,
                                            decoration: kInputDecoration(
                                                "Prenom",
                                                "Entrez votre prenom")),
                                        TextFormField(
                                            controller: emailController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.isEmpty
                                                ? "Champs obligatoire"
                                                : null,
                                            onSaved: (val) =>
                                                emailController.text = val!,
                                            decoration: kInputDecoration(
                                                "Email",
                                                "Entrez votre adresse email")),
                                        TextFormField(
                                            controller: phoneController,
                                            keyboardType: TextInputType.phone,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.isEmpty
                                                ? "Champs obligatoire"
                                                : null,
                                            onSaved: (val) =>
                                                phoneController.text = val!,
                                            decoration: kInputDecoration(
                                                "Telephone",
                                                "Entrez votre numero de telephone")),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(children: <Widget>[
                                          Text(
                                            "Votre sexe   ",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          DropdownButton(
                                            value: sexe,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: items.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                sexe = newValue!;
                                              });
                                            },
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(children: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              _selectDate(context);
                                            },
                                            child: Text("Date de Naissance"),
                                          ),
                                          Text(date_birth),
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                            controller: passwordController,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            autofocus: true,
                                            obscureText: true,
                                            validator: (val) => val!.isEmpty
                                                ? "Champs obligatoire"
                                                : null,
                                            onSaved: (val) =>
                                                passwordController.text = val!,
                                            decoration: kInputDecoration(
                                                "Mot de passe",
                                                "Entrez votre mot de passe")),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                            controller: re_passwordController,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            autofocus: true,
                                            obscureText: true,
                                            validator: (val) => val!.isEmpty
                                                ? "Champs obligatoire"
                                                : null,
                                            onSaved: (val) =>
                                                re_passwordController.text =
                                                    val!,
                                            decoration: kInputDecoration(
                                                "Confirmer votre mot de passe",
                                                "Confirmer votre mot de passe")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        RaisedButton(
                                          onPressed: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              registerUser();
                                            }
                                          },
                                          color: Color(0xFF00BCD4),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 10),
                                          splashColor: Colors.grey,
                                          child: Text(
                                            _isLoading
                                                ? "Registing..."
                                                : "Inscription",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Forgot_password()),
                                            );
                                          },
                                          child: Text(
                                            "Avez vous oublié votre mot de passe",
                                            style:
                                                TextStyle(color: Colors.blue),
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
                                                        LoginPage()),
                                              );
                                            },
                                            child: Text(
                                              "Se connecter",
                                              style: TextStyle(
                                                  color: Colors.blueAccent),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ])))),
                ),
              ],
            ),
          ),
        ])),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime.now().subtract(Duration(days: 0)));
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selectedDate;
        date_birth =
            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
      });
  }
}
