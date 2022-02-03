import 'dart:convert';

import 'package:wash/models/api_response.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> createPrescription(
  int consultationId,
  String? medicine,
  String? exam,
) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjQzLjE5Mzo4MDAwXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQzNjU2MzY0LCJleHAiOjE2NDM2NTk5NjQsIm5iZiI6MTY0MzY1NjM2NCwianRpIjoicUt3ZFhhclFHU05JV2RwRyIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.k7bgK3ghiFGR4bdtjPawMq9_Zhk-dLItUlcJ0-Qu7J8';
    final response = await http.post(
        Uri.parse(
            "http://192.168.43.193:8000/api/consultations/$consultationId/prescriptions"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: exam != null
            ? {
                
                'medicine': medicine,
                'exam': exam,
              }
            : {
                'medicine': medicine,
              }
           );
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