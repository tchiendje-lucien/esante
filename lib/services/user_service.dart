import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash/models/user_model.dart';
import 'package:wash/sreems/api_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';
import 'api.dart';

String url = "http://192.168.1.100:8000/api/register";
//Register
Future<ApiResponse> register(
    String email,
    String password,
    String name,
    String surname,
    String sexe,
    String phone,
    String re_password,
    String date_birth) async {
  var formData = {
    'email': email,
    'password': password,
    're_password': re_password,
    'phone': phone,
    'name': name,
    'surname': surname,
    'date_birth': date_birth,
    'sexe': sexe,
  };
  ApiResponse apiResponse = ApiResponse();
  try {
    var response = await http.post(
        Uri.parse(url+"register"),
        body: jsonEncode(formData),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
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

//Login
Future<ApiResponse> login(
  String email,
  String password,
) async {
  var formData = {
    'email': email,
    'password': password,
  };
  ApiResponse apiResponse = ApiResponse();
  try {
    var response = await http.post(
        Uri.parse("http://192.168.1.100:8000/api/login"),
        body: jsonEncode(formData),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
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

//Get User Detail
Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http
        .get(Uri.parse("http://192.168.1.101:8000/api/profile"),
        headers:
        {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          'Authorization': "bearer $token"
    });
    print(jsonDecode(response.body));
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 401:
        apiResponse.error = jsonDecode(response.body);
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

//Get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("token") ?? "";
}

//Get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt("userId") ?? 0;
}

//Logout user
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}
