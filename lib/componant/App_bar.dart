import 'package:flutter/material.dart';
import '../Simple_user_profil.dart';

/*class App_bar extends StatefulWidget {
  @override
  State<App_bar> createState() => _App_barState();
}*/

class App_bar extends StatefulWidget {
  @override
  State<App_bar> createState() => _App_barState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class _App_barState extends State<App_bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
AppBar headerNav({String? title, required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    title: Text(title!),
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
            MaterialPageRoute(builder: (context) => Simple_user_profil()),
          );
        },
        child: CircleAvatar(
          backgroundImage: AssetImage("images/alan-walker-460x460.jpg"),
        ),
      )
    ],
  );
}
