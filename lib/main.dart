import 'package:flutter/material.dart';
import 'package:wash/sreems/loading.dart';
import 'Contact_medecin.dart';
import 'Create_traitement.dart';
import 'Home_page.dart';
import 'Simple_user_profil.dart';
import 'LoginPage.dart';
import 'Traitement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Sante',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return loading();
  }
}
