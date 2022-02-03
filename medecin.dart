import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;
import 'package:wash/models/doctor_model.dart';
import 'package:wash/services/doctor_service.dart';

class Contact_medecin extends StatefulWidget {
  Contact_medecin({Key? key}) : super(key: key);

  @override
  State<Contact_medecin> createState() => _Contact_medecinState();
}

class _Contact_medecinState extends State<Contact_medecin> {
  String url = 'http://192.168.43.193:8000/api/doctors';
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzMzUxMjkyLCJleHAiOjE2NDMzNTQ4OTIsIm5iZiI6MTY0MzM1MTI5MiwianRpIjoiR0dNclNUVEpxVVFvTHdJSyIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.7ARIvrmAEx7l10AXLcmiWnuScNrRyJzYoRZCPwCJC2Y';

  //List<Doctor> _doctor = <Doctor>[];
  /*  List<Doctor> _doctor = [];
   Future<List<Doctor>> fetchDoctor() async {
    var response = await http.get(
      Uri.parse(url),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    //var doctor = <Doctor>[];
    if (response.statusCode == 200) {
      var jsonbody = json.decode(response.body);
      //print(response.body);
      for (var doctorjson in jsonbody) {
        //doctor.add(Doctor.fromJson(doctorjson));
        Doctor dr =
            //Doctor(title: doctorjson['title'], body: doctorjson['body']);
            Doctor(
                hospital_name: doctorjson[' hospital_name'],
                hospital_phone: doctorjson['hospital_phone']);
        _doctor.add(dr);
      }

      print(_doctor.length);
     
    } else {
      print('Something Wrong');
    }
    return _doctor;
  }*/

  Future<List<Doctor>> fetchDoctor() async {
    final jsondata = await rootBundle.rootBundle.loadString("jsonfile/doctor.json");
    final list = json.decode(jsondata) as List<dynamic>;
    var _doctor = list.map((e) => Doctor.fromJson(e)).toList();

    return _doctor;
  }

  @override
  void initState() {
    fetchDoctor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Medecin'),
        ),
        body: FutureBuilder(
          future: fetchDoctor(),
          builder: (context, data) {
            if (data.hasError) {
              return Container(
                child: Center(
                  child: Text('${data.error}'),
                ),
              );
            } else if (data.hasData) {
              var items = data.data as List<Doctor>;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 32, bottom: 32, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            items[index].hospital_name.toString(),
                            //snapshot.data[index].title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            items[index].hospital_phone.toString(),
                            //snapshot.data[index].body,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}

