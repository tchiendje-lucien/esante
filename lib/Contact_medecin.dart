import 'package:flutter/material.dart';

import 'Simple_user_profil.dart';
import 'componant/App_bar.dart';
import 'componant/Menu_bar.dart';

class Contact_medecin extends StatefulWidget {
  @override
  State<Contact_medecin> createState() => _Contact_medecinState();
}

class _Contact_medecinState extends State<Contact_medecin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("Medecins"),
                  actions: <Widget>[
                    Icon(
                      Icons.notifications_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Simple_user_profil()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("images/alan-walker-460x460.jpg"),
                      ),
                    )
                  ],
                  bottom: TabBar(tabs: <Widget>[
                    Tab(
                      child: Text(
                        "Généralistes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Spécialisé",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
                ),
                drawer: Menu_bar(),
                body: TabBarView(
                  children: [
                    ListView(
                      children: <Widget>[
                        ListTile(
                          leading:
                              Icon(Icons.person, color: Colors.blue, size: 50),
                          title: Text(
                            "MOTOUM Sonia Aureline",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          subtitle: Text(
                            "No description",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                          onTap: () {
                            debugPrint("Maladie mortelle");
                          },
                        ),
                      ],
                    ),
                    ListView(
                      children: <Widget>[
                        ListTile(
                          leading:
                              Icon(Icons.person, color: Colors.blue, size: 50),
                          title: Text(
                            "TCHIENDJE Lucien",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          subtitle: Text(
                            "No description",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                          onTap: () {
                            debugPrint("Maladie mortelle");
                          },
                        ),
                      ],
                    )
                  ],
                )
                /*Center(
        child: Column(
          children: [
            ListView(
              
            )
          ],

      ), 
    )*/
                )));
  }
}
