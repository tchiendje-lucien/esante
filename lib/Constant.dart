import 'package:flutter/material.dart';

final String url ="http://192.168.1.101:8000/api/";

InputDecoration kInputDecoration(String labelText, String hintText) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey),
  );
}

RaisedButton submitButtom(String label, Function onPressed) {
  return RaisedButton(
    onPressed: () => onPressed,
    color: Color(0xFF00BCD4),
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    splashColor: Colors.grey,
    child: Text(
      label,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
