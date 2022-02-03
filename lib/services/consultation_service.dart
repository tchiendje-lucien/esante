//create a consultation
import 'dart:convert';

import 'package:wash/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:wash/models/consultation_model.dart';

Future<ApiResponse> createConsultation(
  int doctorId,
  String? weight,
  String? temperature,
  String? medical_background,
  String? problems,
) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzNDg4NjMzLCJleHAiOjE2NDM0OTIyMzMsIm5iZiI6MTY0MzQ4ODYzMywianRpIjoiclN6aWEwRTBIMnYwYjE0MCIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.hG54DWRCVl2VxhY65mvEjz1saE77SekYMh_IMosTWMg';
    final response = await http.post(
        Uri.parse(
            "http://192.168.43.193:8000/api/doctors/$doctorId/consultations"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: medical_background != null
            ? {
                'weight': weight,
                'temperature': temperature,
                'medical_background': medical_background,
                'problems': problems,
              }
            : {
                'weight': weight,
                'temperature': temperature,
                'problems': problems,
              });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 403:
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

Future<ApiResponse> getConsultations(int doctorId ) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzMjY5NjgwLCJleHAiOjE2NDMyNzMyODAsIm5iZiI6MTY0MzI2OTY4MCwianRpIjoicmVSY2wxZFZ2ZTZJaU11cSIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.lvw2uWzLfGlb8ykFFt3KOXv0iJRpnaFRbFiDZW-bLuI';
    final response = await http.get(
      Uri.parse(
          "http://192.168.43.193:8000/api/doctors/$doctorId/consultations"),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = (jsonDecode(response.body) as List<dynamic>)
            .map((p) => Consultation.fromJson(p))
            .toList();
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
