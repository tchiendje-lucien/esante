import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Forgot_password.dart';
import 'LoginPage.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool value_radio = false;
  int val = -1;
  String value = "";
  String name = "";
  String password = "";
  String surname = "";
  String phone = "";
  final formkey = new GlobalKey<FormState>();
  // Initial Selected Value
  String dropdownvalue = 'Homme';
  // List of items in our dropdown menu
  var items = ['Homme', 'Femme'];
  String date = "";
  DateTime selectedDate = DateTime.now();

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
                                            keyboardType: TextInputType.text,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.length == 0
                                                ? "Valider votre nom"
                                                : null,
                                            onSaved: (val) => name = val!,
                                            decoration: InputDecoration(
                                              labelText: 'Nom',
                                              hintText: 'Entrez votre nom ',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        TextFormField(
                                            keyboardType: TextInputType.text,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.length == 0
                                                ? "Valider votre prenom"
                                                : null,
                                            onSaved: (val) => surname = val!,
                                            decoration: InputDecoration(
                                              labelText: 'Prenom',
                                              hintText: 'Entrez votre prenom ',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.length == 0
                                                ? "Valider votre adresse email"
                                                : null,
                                            onSaved: (val) => name = val!,
                                            decoration: InputDecoration(
                                              labelText: 'Adresse email',
                                              hintText:
                                                  'Entrez votre adresse email ',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        TextFormField(
                                            keyboardType: TextInputType.phone,
                                            autocorrect: true,
                                            autofocus: true,
                                            validator: (val) => val!.length == 0
                                                ? "Valider votre numero de téléphone"
                                                : null,
                                            onSaved: (val) => phone = val!,
                                            decoration: InputDecoration(
                                              labelText: 'Téléphone',
                                              hintText:
                                                  'Entrez votre numero de téléphone',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(children: <Widget>[
                                          Text(
                                            "Votre sexe   ",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          DropdownButton(
                                            value: dropdownvalue,
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
                                                dropdownvalue = newValue!;
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
                                          Text(
                                              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            autofocus: true,
                                            obscureText: true,
                                            validator: (val) => val!.length == 0
                                                ? "Valider votre mot de passe"
                                                : null,
                                            onSaved: (val) => password = val!,
                                            decoration: InputDecoration(
                                              labelText: 'Mot de passe',
                                              hintText:
                                                  'Entrez votre mot de passe',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            autofocus: true,
                                            obscureText: true,
                                            validator: (val) => val!.length == 0
                                                ? "Valider votre mot de passe"
                                                : null,
                                            onSaved: (val) => password = val!,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Confirmez votre mot de passe',
                                              hintText:
                                                  'Confirmez votre mot de passe',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
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
                                            "Inscription",
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
        selectedDate = selected;
      });
  }
}
