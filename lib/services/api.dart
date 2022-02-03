import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';

class CallApiPost{
  final String url ="http://192.168.1.101:8000/api/";
  postData(data, apiUrl) async {
    var fullUrl=url+apiUrl;
   return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: setHeaders()
    );
  }

  setHeaders()=>{
    'Content-Type': 'application/json; charset=UTF-8',
    "Accept":"application/json"
  };
}