import 'package:flutter/material.dart';
import 'package:wash/Create_traitement.dart';

import 'Simple_user_profil.dart';
import 'componant/App_bar.dart';
import 'componant/Menu_bar.dart';

class Traitement extends StatefulWidget {
  @override
  State<Traitement> createState() => _TraitementState();
}

class _TraitementState extends State<Traitement> {
  void ActionButtom() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Create_traitement()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Mes traitements"),
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
                      "Tous",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "A venir",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "En cours",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Passer",
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
                        leading: Icon(Icons.circle_rounded,
                            color: Colors.blue, size: 30),
                        title: Text(
                          "Chlamedia",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "No description",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        onTap: () {
                          debugPrint("Maladie mortelle");
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.circle_rounded,
                            color: Colors.green, size: 30),
                        title: Text(
                          "Chaude pisse",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "No description",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        onTap: () {
                          debugPrint("Maladie mortelle");
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.circle_rounded,
                            color: Colors.red, size: 30),
                        title: Text(
                          "Faiblesse sexuelle",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "No description",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
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
                        leading: Icon(Icons.circle_rounded,
                            color: Colors.blue, size: 30),
                        title: Text(
                          "Chlamedia",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "No description",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
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
                        leading: Icon(Icons.circle_rounded,
                            color: Colors.green, size: 30),
                        title: Text(
                          "Faiblesse sexuelle",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "No description",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
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
                        leading: Icon(Icons.circle_rounded,
                            color: Colors.red, size: 30),
                        title: Text(
                          "Chaude pisse",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "No description",
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        onTap: () {
                          debugPrint("Maladie mortelle");
                        },
                      ),
                    ],
                  ),
                ],
              ),
              /*Center(
        child: Column(
          children: [
            ListView(

            )
          ],

      ),
    )*/
              floatingActionButton: FloatingActionButton(
                onPressed: ActionButtom,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add),
              ),
            )));
  }
}
