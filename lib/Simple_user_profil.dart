import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'componant/App_bar.dart';
import 'componant/Menu_bar.dart';

class Simple_user_profil extends StatefulWidget {
  @override
  State<Simple_user_profil> createState() => _Simple_user_profilState();
}

class _Simple_user_profilState extends State<Simple_user_profil> {
  bool value_radio = false;
  int val = -1;
  String value = "";
  String name = "";
  String password = "";
  String surname = "";
  String phone = "";
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
      appBar: headerNav(title: 'Mon profil', context: context),
      drawer: Menu_bar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 58,
                backgroundImage: AssetImage("images/alan-walker-460x460.jpg"),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(CupertinoIcons.camera),
                    ),
                  ),
                ]),
              ),
              Text(
                "Lucien Didier",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key: formkey,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              keyboardType: TextInputType.text,
                              autocorrect: true,
                              autofocus: true,
                              validator: (val) =>
                                  val!.length == 0 ? "Valider votre nom" : null,
                              onSaved: (val) => name = val!,
                              decoration: InputDecoration(
                                labelText: 'Nom',
                                hintText: 'Entrez votre nom ',
                                hintStyle: TextStyle(color: Colors.grey),
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
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: true,
                              autofocus: true,
                              validator: (val) => val!.length == 0
                                  ? "Valider votre adresse email"
                                  : null,
                              onSaved: (val) => name = val!,
                              decoration: InputDecoration(
                                labelText: 'Adresse email',
                                hintText: 'Entrez votre adresse email ',
                                hintStyle: TextStyle(color: Colors.grey),
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
                                labelText: 'Telephone',
                                hintText: 'Entrez votre numero de téléphone',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          Row(children: <Widget>[
                            Container(
                              height: 20,
                              width: 116,
                              child: ListTile(
                                title: Text("Mr"),
                                leading: Radio(
                                  value: 1,
                                  groupValue: val,
                                  onChanged: (value_radio) {
                                    setState(() {
                                      val = value_radio as int;
                                    });
                                  },
                                  activeColor: Color(0xFF00BCD4),
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 134,
                              child: ListTile(
                                title: Text("Mme"),
                                leading: Radio(
                                  value: 2,
                                  groupValue: val,
                                  onChanged: (value_radio) {
                                    setState(() {
                                      val = value_radio as int;
                                    });
                                  },
                                  activeColor: Color(0xFF00BCD4),
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              autofocus: true,
                              obscureText: true,
                              validator: (val) => val!.length == 0
                                  ? "Valider votre mot de passe"
                                  : null,
                              onSaved: (val) => password = val!,
                              decoration: InputDecoration(
                                labelText: 'Mot de passe',
                                hintText: 'Entrez votre mot de passe',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              autofocus: true,
                              obscureText: true,
                              validator: (val) => val!.length == 0
                                  ? "Valider votre mot de passe"
                                  : null,
                              onSaved: (val) => password = val!,
                              decoration: InputDecoration(
                                labelText: 'Confirmez votre mot de passe',
                                hintText: 'Confirmez votre mot de passe',
                                hintStyle: TextStyle(color: Colors.grey),
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
                              "Modifier",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
