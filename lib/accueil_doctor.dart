import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:wash/models/consultation_model.dart';
import 'package:wash/screens/Consultation_response.dart';
//import 'package:wash/screens/Consultation.dart';
//import 'models/doctor_model.dart';

class Accueil_doctor extends StatefulWidget {
  Accueil_doctor({Key? key}) : super(key: key);

  @override
  State<Accueil_doctor> createState() => _Accueil_doctorState();
}

class _Accueil_doctorState extends State<Accueil_doctor> {
  // String url = 'http://192.168.43.193:8000/api/doctors';
  //String token ='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzNDUxNjUyLCJleHAiOjE2NDM0NTUyNTIsIm5iZiI6MTY0MzQ1MTY1MiwianRpIjoiWjJhM0hpcGFwOHBaQlFtZSIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D7toCUSPkIhmhpf3NwhQGzcYkP1cMbs7gnH2uKwHsvM';

  @override
  void initState() {
    fetchConsultation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME DOCTOR'),
      ),
      body: FutureBuilder(
        future: fetchConsultation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(child: Text("Loading...")),
            );
          } else {
            var items = snapshot.data as List<Consultation>;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            //radius: 50,
                            backgroundImage: AssetImage('images/user.png'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    'Poids : ${items[index].weight.toString()} kg ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      'Temperature : ${items[index].temperature.toString()} °C',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.greenAccent),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      'Antecedents Medicaux : ${items[index].medical_background.toString()}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      'Problemes : ${items[index].problems.toString()}',
                                      
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                                GestureDetector(
                                  child: Text("Repondre",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue)),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Consultation_response(consultationId : items[index].id,)),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
        },
      ),
    );
  }

  Future<List<Consultation>> fetchConsultation() async {
    final jsondata = await rootBundle.rootBundle.loadString("jsonfile/consultation.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Consultation.fromJson(e)).toList();
  }

}
