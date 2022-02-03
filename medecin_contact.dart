import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:wash/models/api_response.dart';
import 'package:wash/models/doctor_model.dart';
import 'package:http/http.dart' as http;
//import 'package:wash/services/doctor_service.dart';

//import 'models/api_response.dart';
//import 'Simple_user_profil.dart';
//import 'componant/App_bar.dart';
//import 'componant/Menu_bar.dart';

class Contact_medecin extends StatefulWidget {
  @override
  State<Contact_medecin> createState() => _Contact_medecinState();
}

class _Contact_medecinState extends State<Contact_medecin> {
  List<Doctor> _doctorList = [];
  bool _loading = true;
  String url = 'http://192.168.43.193:8000/api/doctors';
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzMjgxMzc0LCJleHAiOjE2NDMyODQ5NzQsIm5iZiI6MTY0MzI4MTM3NCwianRpIjoiU0pWZFE3TThZbzFvYnIzZiIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.ZeKPvoMkHu9yv6uSuBgW1dyzZPuvRrurIvQ8gWkETE8';

  @override
  void initState() {
    retrieveDoctors();
    super.initState();
  }

  retrieveDoctors() async {
    /* Future<void> ApiResponse response = await getDoctors();
    if (response.error == null) {
      setState(() {
        _doctorList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    } else {
      /* ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {
        _loading = !_loading;
      });*/

      print('Something Wrong');
    }*/
    var response = await http.get(
      Uri.parse(url),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    /*if (response.statusCode == 200) {
      var jsonbody = json.decode(response.body.toString());
      print(jsonbody);
      for (var data in jsonbody) {
        _doctorList.add(new Doctor(
            id: data[0]['id'],
            hospital_name: data[1]['hospital_name'],
            hospital_phone: data[2]['hospital_phone'],
            speciality: data['speciality'],
            domaine: data['domaine'],
            ville: data['ville'],
            quartier: data['quartier']));
      }
      setState(() {});
      _doctorList.forEach(
          (element) => print("Hospital_name : ${element.hospital_name}"));
    } else {
      print('Something Wrong');
    }
    return _doctorList;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOCTORS'),
      ),
       body: FutureBuilder(
          future: fetchDoctor(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading....'),
                ),
              );
      return  ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 32, bottom: 32, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'text',
                            //snapshot.data[index].title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'body',
                            //snapshot.data[index].body,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
       
    );
  }
}









 return Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 32, bottom: 32, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: <Widget>[
                        
                        CircleAvatar(
                          backgroundImage: AssetImage('images/doctor.jpg'),
                        radius: 70,
                        ),
                        Text(
                          snapshot.data[index].title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          snapshot.data[index].body,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                );






FutureBuilder(
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
        )















        FutureBuilder(
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
        )