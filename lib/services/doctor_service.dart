//get all doctors

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:wash/componant/const.dart';
import 'package:wash/models/api_response.dart';
import 'package:wash/models/doctor_model.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> getDoctors() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzMjY5NjgwLCJleHAiOjE2NDMyNzMyODAsIm5iZiI6MTY0MzI2OTY4MCwianRpIjoicmVSY2wxZFZ2ZTZJaU11cSIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.lvw2uWzLfGlb8ykFFt3KOXv0iJRpnaFRbFiDZW-bLuI';
    final response = await http.get(
      Uri.parse("http://192.168.43.193:8000/api/doctors"),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    switch (response.statusCode) {
      case 200:
        //apiResponse.data = json.decode(response.body)['doctors'].map((item) => Doctor.fromJson(item)).toList().cast<String, dynamic>();
        //json.decode(response.body)['doctors'].map((p) => Doctor.fromJson(p)).toList();
        //List responseJson = json.decode(response.body.toString());
        //List<News> newsTitle = createNewsList(responseJson["doctors"]);
        //apiResponse.data = jsonDecode(response.body);
        // print(newsTitle);
        //apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = 'unauthorized';
        break;
      default:
        apiResponse.error = "Something wrong";
        break;
    }
  } catch (e) {
    apiResponse.error = "Server Error";
    print(e);
  }

  return apiResponse;
}

//create a doctor
Future<ApiResponse> createDoctor(
    String? name,
    String? surname,
    String? phone,
    String? hospital_name,
    String? hospital_phone,
    String? speciality,
    String? domaine,
    String? ville,
    String? quartier) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzNjU2MzY0LCJleHAiOjE2NDM2NTk5NjQsIm5iZiI6MTY0MzY1NjM2NCwianRpIjoicUt3ZFhhclFHU05JV2RwRyIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.k7bgK3ghiFGR4bdtjPawMq9_Zhk-dLItUlcJ0-Qu7J8';
    final response = await http.post(
        Uri.parse("http://192.168.43.193:8000/api/doctors/save"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: domaine != null
            ? {
                'name': name,
                'surname': surname,
                'phone': phone,
                'hospital_name': hospital_name,
                'hospital_phone': hospital_name,
                'speciality': speciality,
                'domaine': domaine,
                'ville': ville,
                'quartier': quartier
              }
            : {
                'name': name,
                'surname': surname,
                'phone': phone,
                'hospital_name': hospital_name,
                'hospital_phone': hospital_name,
                'speciality': speciality,
                'ville': ville,
                'quartier': quartier
              });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = "Something wrong";
        break;
    }
  } catch (e) {
    apiResponse.error = "Server Error";
  }

  return apiResponse;
}
