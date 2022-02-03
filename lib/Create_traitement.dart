import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wash/services/traitement_services.dart';
import 'package:wash/services/user_service.dart';
import 'package:wash/sreems/api_response.dart';
import 'componant/App_bar.dart';
import 'componant/Menu_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Create_traitement extends StatefulWidget {
  @override
  State<Create_traitement> createState() => _Create_traitementState();
}

class _Create_traitementState extends State<Create_traitement> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController traimenteController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController posologieController = TextEditingController();
  TextEditingController dureeController = TextEditingController();
  bool _isLoading = false;
  bool value_radio = false;
  int val = -1;
  String date_debut = "";
  String value = "";
  final formkey = new GlobalKey<FormState>();
  String date = "";
  DateTime selectedDate = DateTime.now();
  String dropdownvalue = 'A quel moment les prendre';
  List dataPeriode = <String>[];
  ApiResponse apiResponse = ApiResponse();
  String itemsPeriode = "";
  List statesList = [];
  String? _myState;
  List treatment = [];

  @override
  void initState() {
    getPeriode();
    super.initState();
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
                              controller: traimenteController,
                              autofocus: true,
                              validator: (val) =>
                                  val!.isEmpty ? "Champs obligatoire" : null,
                              onSaved: (val) => traimenteController.text = val!,
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
                              controller: descController,
                              autocorrect: true,
                              autofocus: true,
                              validator: (val) =>
                                  val!.isEmpty ? "Champs obligatoire" : null,
                              onSaved: (val) => descController.text = val!,
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
                              controller: posologieController,
                              autofocus: true,
                              validator: (val) =>
                                  val!.isEmpty ? "Champs obligatoire" : null,
                              onSaved: (val) => posologieController.text = val!,
                              decoration: InputDecoration(
                                labelText: 'Posologie',
                                hintText: 'Comment devez vous le prendre?',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: _myState,
                                    iconSize: 30,
                                    icon: (null),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                    hint: Text("Select Periode..."),
                                    onChanged: (newValue) {
                                      setState(() {
                                        _myState = newValue!;
                                        // _getCitiesList();
                                        print(_myState);
                                      });
                                    },
                                    items: statesList?.map((item) {
                                          return new DropdownMenuItem(
                                            child: new Text(
                                                item['libelle_periode']),
                                            value: item['id'].toString(),
                                          );
                                        })?.toList() ??
                                        [],
                                  ),
                                ),
                              ),
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
                            Text("${date_debut}"),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.phone,
                              autocorrect: true,
                              autofocus: true,
                              controller: dureeController,
                              validator: (val) =>
                                  val!.isEmpty ? "Champs obligatoire" : null,
                              onSaved: (val) => dureeController.text = val!,
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
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                createTraitement();
                              }
                            },
                            color: Color(0xFF00BCD4),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            splashColor: Colors.grey,
                            child: Text(
                              _isLoading ? "Creating..." : "Créer",
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

  //Construct date
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
        date_debut =
            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
      });
  }

  //Get periode
  Future<String> getPeriode() async {
    String token = await getToken();
    await http.get(Uri.parse(url + "get_periode"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      'Authorization': "bearer $token"
    }).then((response) {
      var data = json.decode(response.body);
      setState(() {
        statesList = data['treatment'];
      });
      print(statesList);
    });
    return "success";
  }

  //Create treatment
  createTraitement() async {
    setState(() {
      _isLoading = true;
    });
    try {
      ApiResponse response = await post_treatment(
          _myState!,
          traimenteController.text,
          descController.text,
          posologieController.text,
          dureeController.text,
          date_debut);
      print(traimenteController.text);
      if (response.error == null) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${response.data}")));
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
}
