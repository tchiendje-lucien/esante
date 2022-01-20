import 'package:flutter/material.dart';
import '../Contact_medecin.dart';
import '../Simple_user_profil.dart';
import '../LoginPage.dart';
import '../Home_page.dart';
import '../Traitement.dart';

class Menu_bar extends StatefulWidget {
  @override
  State<Menu_bar> createState() => _Menu_barState();
}

class _Menu_barState extends State<Menu_bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 265,
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Simple_user_profil()),
                );
              },
              child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("images/alan-walker-460x460.jpg"),
                      fit: BoxFit.cover,
                    )),
                child: Text(
                  "",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),

            /*      DrawerHeader(
          child: UserAccountsDrawerHeader(
            accountName: Text('Test123'),
            accountEmail: Text('test@123.com'),
            currentAccountPicture: Image.asset(
                "images/alan-walker-460x460.jpg"),
          ),
        ),*/
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Acceuil",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home_page()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text(
                "Mes traitement",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Traitement()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border_outlined),
              title: Text(
                "Mes ordonance",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text(
                "Actualité santé",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text(
                "Contacter un médecin",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact_medecin()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text(
                "Hopitaux et Pharmacie autour de moi",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Parametre",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Deconnexion",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ));
  }
}
