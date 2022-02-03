import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash/models/user_model.dart';
import 'package:wash/services/user_service.dart';
import 'package:wash/sreems/api_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';
import 'api.dart';

//Create treatmeent
Future<ApiResponse> post_treatment(
    String periode_id,
    String titre_traitement,
    String desc_traitement,
    String posologie,
    String duree,
    String date_debut) async {
  var formData = {
    'periode_id': periode_id,
    'titre_traitement': titre_traitement,
    'desc_traitement': desc_traitement,
    'posologie': posologie,
    'duree': duree,
    'date_debut': date_debut,
  };
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    var response = await http.post(
        Uri.parse(url+"post_treatment"),
        body: jsonEncode(formData),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          'Authorization': "bearer $token"
        });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
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
