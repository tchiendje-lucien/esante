import 'package:flutter/material.dart';
import 'Contact_medecin.dart';
import 'Traitement.dart';
import 'componant/App_bar.dart';
import 'componant/Menu_bar.dart';

class Home_page extends StatefulWidget {
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(title: 'Acceuil', context: context),
      drawer: Menu_bar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF00BCD4),
                            Colors.indigo,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.medical_services,
                              color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Mes traitement',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Traitement()),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF00BCD4),
                            Colors.indigo,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_border_outlined,
                              color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Mes ordonance',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      print("Click event on Container");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF00BCD4),
                            Colors.indigo,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.forum, color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Actualité santé',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      print("Click event on Container");
                    },
                  ),
                  InkWell(
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF00BCD4),
                            Colors.indigo,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Contacter un médecin',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Contact_medecin()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF00BCD4),
                            Colors.indigo,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_hospital,
                              color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Hopitaux et Pharmacie autour de moi',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      print("Click event on Container");
                    },
                  ),
                  InkWell(
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF00BCD4),
                            Colors.indigo,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings, color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            'Parametre',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      print("Click event on Container");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
