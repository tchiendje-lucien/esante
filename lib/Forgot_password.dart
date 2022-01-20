import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
import 'LoginPage.dart';

class Forgot_password extends StatefulWidget {
  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {
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
                      "Réinitialiser le mot de passe",
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
                                      borderRadius: BorderRadius.circular(10)),
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
                                                      'Email ou Téléphone *',
                                                  hintText:
                                                      'Email ou Téléphone ',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                )),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            RaisedButton(
                                              onPressed: validationForm,
                                              color: Color(0xFF00BCD4),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 50, vertical: 10),
                                              splashColor: Colors.grey,
                                              child: Text(
                                                "Envoyer",
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
                                          MaterialPageRoute(builder: (context) => LoginPage()),
                                        );
                                      },
                                      child: Text(
                                        "Se Connecter",
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
                  )
                ],
              ),
            ),
          ]))),
    );
  }
}
