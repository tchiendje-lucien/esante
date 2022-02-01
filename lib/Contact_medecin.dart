import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;
import 'package:wash/screens/Consultation.dart';
import 'models/doctor_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_medecin extends StatefulWidget {
  Contact_medecin({Key? key}) : super(key: key);

  @override
  State<Contact_medecin> createState() => _Contact_medecinState();
}

class _Contact_medecinState extends State<Contact_medecin> {
  // String url = 'http://192.168.43.193:8000/api/doctors';
  //String token ='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzNDUxNjUyLCJleHAiOjE2NDM0NTUyNTIsIm5iZiI6MTY0MzQ1MTY1MiwianRpIjoiWjJhM0hpcGFwOHBaQlFtZSIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.D7toCUSPkIhmhpf3NwhQGzcYkP1cMbs7gnH2uKwHsvM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste Medecins'),
      ),
      body: FutureBuilder(
        future: fetchDoctor(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(child: Text("Loading...")),
            );
          } else {
            var items = snapshot.data as List<Doctor>;
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
                            backgroundImage: AssetImage('images/doctor.jpg'),
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
                                    'Dr.${items[index].name.toString()} ${items[index].surname.toString()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      '${items[index].speciality.toString()}-${items[index].domaine.toString()}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.greenAccent
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      '${items[index].hospital_name.toString()}-${items[index].ville.toString()}-${items[index].quartier.toString()}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      '${items[index].phone.toString()}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                                GestureDetector(
                                    child: Text("Faire une consultation",
                                        style: TextStyle(
                                            decoration:TextDecoration.underline,
                                            color: Colors.blue)
                                            ),
                                     onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Consultation(doctorId: items[index].id,
                                            )),
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

  Future<List<Doctor>> fetchDoctor() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("jsonfile/doctor.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Doctor.fromJson(e)).toList();
  }
}
