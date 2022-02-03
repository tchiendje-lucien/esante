import 'package:flutter/material.dart';
import 'package:wash/models/api_response.dart';
import 'package:wash/screens/Ordonnance.dart';
import 'package:wash/services/ordonnance_service.dart';

class Consultation_response extends StatefulWidget {
  //Consultation_response({Key? key}) : super(key: key);

  final int? consultationId;

  Consultation_response({this.consultationId});

  @override
  State<Consultation_response> createState() => _Consultation_responseState();
}

class _Consultation_responseState extends State<Consultation_response> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _txtmedicine = TextEditingController();
  TextEditingController _txtexam = TextEditingController();

  bool _loading = true;

  //create prescription
  void _createPrescription() async {
    ApiResponse response = await createPrescription(
      widget.consultationId ?? 0,
      _txtmedicine.text,
      _txtexam.text,
    );

    if (response.error == null) {
      //final result = await Navigator.pushNamed(context, "/home_doctor");
      //Navigator.pop(context, result);

      _txtmedicine.clear();
      _txtexam.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Ordonnance Envoyee')));
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
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDONNANCE'),
        //backgroundColor: Colors.greenAccent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Redigez Une Ordonnance A Votre Patient',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _txtmedicine,
                keyboardType: TextInputType.multiline,
                maxLines: 9,
                validator: (val) =>
                    val!.isEmpty ? 'Medicine is required ' : null,
                decoration: InputDecoration(
                    labelText: 'Prescrire des medicaments',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.black12))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _txtexam,
                keyboardType: TextInputType.multiline,
                maxLines: 9,
                decoration: InputDecoration(
                    labelText: 'Examen a faire',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.black12))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  // primary: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    /* ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );*/
                    //Navigator.pushNamed(context , "home_doctor");
                    setState(() {
                      _loading = !_loading;
                    });
                    _createPrescription();
                  }
                },
                child: const Text('Rediger Ordonnance'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
