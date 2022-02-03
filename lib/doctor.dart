import 'package:flutter/material.dart';
import 'package:wash/accueil_doctor.dart';
import 'package:wash/models/api_response.dart';
import 'package:wash/services/doctor_service.dart';

void main() => runApp(const doctor());
bool _loading = false;

class doctor extends StatelessWidget {
  const doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add Doctor Information';

    return MaterialApp(

      routes: {
        //This is what you are missing i guess
        "/home_doctor": (context) => Accueil_doctor(),
        
      },

      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          
          body: ListView(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/doctor.jpg'),
                        radius: 70,
                      ),
                    ),
                    const MyCustomForm(),
                  ],
                )),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _txthptname = TextEditingController();
  TextEditingController _txthptphone = TextEditingController();
  TextEditingController txtspeciality = TextEditingController();
  TextEditingController txtdomaine = TextEditingController();
  TextEditingController txtville = TextEditingController();
  TextEditingController txtquartier = TextEditingController();
  TextEditingController _txtname = TextEditingController();
  TextEditingController _txtsurname = TextEditingController();
  TextEditingController _txtphone = TextEditingController();

  void _createDoctor() async {
    ApiResponse response = await createDoctor(
        _txtname.text,
        _txtsurname.text,
        _txtphone.text,
        _txthptname.text,
        _txthptphone.text,
        txtspeciality.text,
        txtdomaine.text,
        txtville.text,
        txtquartier.text);

    if (response.error == null) {
      final result = await Navigator.pushNamed(context, "/home_doctor");
      Navigator.pop(context , result);
      
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {
        _loading = !_loading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _txtname,
              validator: (val) =>
                  val!.isEmpty ? 'Doctor Name is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Nom Medecin',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _txtsurname,
              validator: (val) =>
                  val!.isEmpty ? 'Doctor Surname is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Prenom Medecin',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _txtphone,
              validator: (val) =>
                  val!.isEmpty ? 'Doctor Contact is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Contact Medecin',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _txthptname,
              validator: (val) =>
                  val!.isEmpty ? 'Hospital Name is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Nom Hopital',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _txthptphone,
              validator: (val) =>
                  val!.isEmpty ? 'Hospital Phone is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Numero Hopital',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: txtspeciality,
              validator: (val) =>
                  val!.isEmpty ? 'Speciality is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Specialite du medecin',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: txtdomaine,
              // validator: (val) => val!.isEmpty ? 'Domain is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Domaine',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),
          Text(
            'Localisation Hopital',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11, fontStyle: FontStyle.italic, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              controller: txtville,
              validator: (val) => val!.isEmpty ? 'City is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Ville ',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: txtquartier,
              validator: (val) => val!.isEmpty ? 'District is required ' : null,
              decoration: InputDecoration(
                  labelText: 'Quartier',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black12))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  /* ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );*/

                  setState(() {
                    _loading = !_loading;
                  });

                  _createDoctor();

                  //Navigator.pushNamed(context , "home_doctor");
                }
              },
              child: const Text('Enregistrer'),
            ),
          ),
        ],
      ),
    );
  }
}
