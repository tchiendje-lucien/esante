import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wash/services/traitement_services.dart';
import 'package:wash/services/user_service.dart';
import 'package:wash/sreems/api_response.dart';
import 'Create_traitement.dart';
import 'Simple_user_profil.dart';
import 'componant/App_bar.dart';
import 'componant/Menu_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Traitement extends StatefulWidget {
  @override
  State<Traitement> createState() => _TraitementState();
}

class _TraitementState extends State<Traitement> {
  bool _isLoading = false;
  List treatment = [];

  @override
  void initState() {
    get_treatment();
    super.initState();
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
                  getBodyListAll(),
                  getBodyListToDo(),
                  getBodyListInProcess(),
                  getBodyListPassed()
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

//Action floating Buttom
  void ActionButtom() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Create_traitement()),
    );
  }

  //Get treatment
  get_treatment() async {
    setState(() {
      _isLoading = true;
    });
    String token = await getToken();
    var response = await http.get(Uri.parse(url + "get_treatment"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      'Authorization': "bearer $token"
    });
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['treatment'];
      print(items);
      setState(() {
        treatment = items;
        _isLoading = false;
      });
    } else {
      treatment = [];
      _isLoading = false;
    }
  }

  //Render All treatment
  Widget getBodyListAll() {
    if (treatment.contains(null) || treatment.length < 0 || _isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: treatment.length,
        itemBuilder: (context, index) {
          return getCard(treatment[index]);
        });
  }

  Widget getCard(item) {
    if (item['etat_traitement_id'] == 1) {
      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Icon(Icons.circle_rounded, color: Colors.blue, size: 30),
            title: Text(
              "${item['titre_traitement']}",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: Text(
                "${item['titre_traitement']}",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            onTap: () {
              debugPrint("Maladie mortelle");
            },
          ),
        ),
      );
    } else if (item['etat_traitement_id'] == 2) {
      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Icon(Icons.circle_rounded, color: Colors.green, size: 30),
            title: Text(
              "${item['titre_traitement']}",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: Text(
                "${item['titre_traitement']}",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            onTap: () {
              debugPrint("Maladie mortelle");
            },
          ),
        ),
      );
    } else if (item['etat_traitement_id'] == 3) {
      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Icon(Icons.circle_rounded, color: Colors.red, size: 30),
            title: Text(
              "${item['titre_traitement']}",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: Text(
                "${item['titre_traitement']}",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            onTap: () {
              debugPrint("Maladie mortelle");
            },
          ),
        ),
      );
    }
    return Container();
  }

  //Render in process treatment
  Widget getBodyListInProcess() {
    if (treatment.contains(null) || treatment.length < 0 || _isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: treatment.length,
        itemBuilder: (context, index) {
          return getCardListInProcess(treatment[index]);
        });
  }

  Widget getCardListInProcess(item) {
    if (item['etat_traitement_id'] == 2) {
      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Icon(Icons.circle_rounded, color: Colors.green, size: 30),
            title: Text(
              "${item['titre_traitement']}",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: Text(
                "${item['titre_traitement']}",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            onTap: () {
              debugPrint("Maladie mortelle");
            },
          ),
        ),
      );
    }
    return Container();
  }

  //Render Passed treatment
  Widget getBodyListPassed() {
    if (treatment.contains(null) || treatment.length < 0 || _isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: treatment.length,
        itemBuilder: (context, index) {
          return getCardListPassed(treatment[index]);
        });
  }

  Widget getCardListPassed(item) {
    if (item['etat_traitement_id'] == 3) {
      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Icon(Icons.circle_rounded, color: Colors.red, size: 30),
            title: Text(
              "${item['titre_traitement']}",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: Text(
                "${item['titre_traitement']}",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            onTap: () {
              debugPrint("Maladie mortelle");
            },
          ),
        ),
      );
    }
    return Container();
  }

  //Render To do treatment
  Widget getBodyListToDo() {
    if (treatment.contains(null) || treatment.length < 0 || _isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: treatment.length,
        itemBuilder: (context, index) {
          return getCardListToDo(treatment[index]);
        });
  }

  Widget getCardListToDo(item) {
    if (item['etat_traitement_id'] == 1) {
      return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Icon(Icons.circle_rounded, color: Colors.blue, size: 30),
            title: Text(
              "${item['titre_traitement']}",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: Text(
                "${item['titre_traitement']}",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ),
            onTap: () {
              debugPrint("Maladie mortelle");
            },
          ),
        ),
      );
    }
    return Center(
      child: Text(
        "Aucun Traitement",
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
