import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'componant/App_bar.dart';
import 'componant/Menu_bar.dart';

class Create_traitement extends StatefulWidget {
  @override
  State<Create_traitement> createState() => _Create_traitementState();
}

class _Create_traitementState extends State<Create_traitement> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  bool value_radio = false;
  int val = -1;
  String value = "";
  String name = "";
  String password = "";
  String surname = "";
  String phone = "";
  final formkey = new GlobalKey<FormState>();
  String date = "";
  DateTime selectedDate = DateTime.now();
  String dropdownvalue = 'A quel moment les prendre';
  // List of items in our dropdown menu
  var items = [
    'A quel moment les prendre',
    'Matin',
    'Soir',
    'Matin-Soir',
    'Matin-Midi-Soir'
  ];

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
      appBar: headerNav(title: 'Nouveau traitement', context: context),
      drawer: Menu_bar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                              val!.length == 0 ? "Ce champs est obligatoire" : null,
                              onSaved: (val) => name = val!,
                              decoration: InputDecoration(
                                labelText: 'Titre du traitement',
                                hintText: 'Titre du traitement',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              autocorrect: true,
                              autofocus: true,
                              validator: (val) => val!.length == 0
                                  ? "Ce champs est obligatoire"
                                  : null,
                              onSaved: (val) => surname = val!,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                hintText: 'Entrez la description ',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              autocorrect: true,
                              autofocus: true,
                              validator: (val) => val!.length == 0
                                  ? "Ce champs est obligatoire"
                                  : null,
                              onSaved: (val) => name = val!,
                              decoration: InputDecoration(
                                labelText: 'Posologie',
                                hintText: 'Comment devez vous le prendre?',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              children: <Widget>[
                                DropdownButton(
                                  value: dropdownvalue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
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
                              child: Text("Date de début"),
                            ),

                            Text("    ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.phone,
                              autocorrect: true,
                              autofocus: true,
                              validator: (val) => val!.length == 0
                                  ? "Ce champs est obligatoire"
                                  : null,
                              onSaved: (val) => phone = val!,
                              decoration: InputDecoration(
                                labelText: 'Durée du traitement',
                                hintText: 'Entrez la durée du traitement',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          SizedBox(
                            height: 20,
                          ),
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
                              "Créer",
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

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}


