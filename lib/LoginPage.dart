import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Forgot_password.dart';
import 'Register.dart';
import 'Home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String value = "";
  String name = "";
  String password = "";
  final formkey = new GlobalKey<FormState>();

  validationForm() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      debugPrint('$name');
      debugPrint('$password');
      formkey.currentState!.reset();
    } else {
      debugPrint('Error....');
    }
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
                                                  keyboardType:
                                                      TextInputType.text,
                                                  autocorrect: true,
                                                  autofocus: true,
                                                  validator: (val) => val!
                                                              .length ==
                                                          0
                                                      ? "Valider votre identifiant"
                                                      : null,
                                                  onSaved: (val) => name = val!,
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
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  autofocus: true,
                                                  validator: (val) => val!
                                                              .length ==
                                                          0
                                                      ? "Valider votre mot de passe"
                                                      : null,
                                                  onSaved: (val) =>
                                                      password = val!,
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
                                                Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Home_page()),
                                                );},
                                                color: Color(0xFF00BCD4),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 50,
                                                    vertical: 10),
                                                splashColor: Colors.grey,
                                                child: Text(
                                                  "Se connecter",
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Forgot_password()),
                                          );
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
                                            MaterialPageRoute(builder: (context) => Register()),
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
