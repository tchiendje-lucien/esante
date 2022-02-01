import 'package:flutter/material.dart';
import 'package:wash/models/api_response.dart';
import 'package:wash/services/consultation_service.dart';

class Consultation extends StatefulWidget {
  // Consultation({Key? key}) : super(key: key);

  final int? doctorId;

  Consultation({this.doctorId});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _txtpoids = TextEditingController();
  TextEditingController _txttemperature = TextEditingController();
  TextEditingController _txtmaladie = TextEditingController();
  TextEditingController _txtdisease = TextEditingController();
  bool _loading = true;

  //create consultation
  void _createConsultation() async {
    ApiResponse response = await createConsultation(
      widget.doctorId ?? 0,
      _txtpoids.text,
      _txttemperature.text,
      _txtmaladie.text,
      _txtdisease.text,
    );

    if (response.error == null) {
      //final result = await Navigator.pushNamed(context, "/home_doctor");
      //Navigator.pop(context, result);
      _txtpoids.clear();
      _txttemperature.clear();
      _txtdisease.clear();
      _txtmaladie.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Consultation Envoyee')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {
        _loading = !_loading;
      });
    }
  }

//List of consultation
  List<dynamic> _consultationList = [];
  Future<void> _getConsultations() async {
    ApiResponse response = await getConsultations(widget.doctorId ?? 0);

    if (response.error == null) {
      setState(() {
        _consultationList = response.data as List<dynamic>;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {
        _loading = !_loading;
      });
    }
  }

  @override
  void initState() {
    _getConsultations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('consultation'),
        ),
        body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
              child: TextFormField(
                controller: _txtpoids,
                validator: (val) =>
                    val!.isEmpty ? 'Doctor Name is required ' : null,
                decoration: InputDecoration(
                    labelText: 'Votre Poids',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.black12))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _txttemperature,
                validator: (val) =>
                    val!.isEmpty ? 'Doctor Name is required ' : null,
                decoration: InputDecoration(
                    labelText: 'Votre Temperature',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.black12))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _txtmaladie,
                keyboardType: TextInputType.multiline,
                maxLines: 7,
                decoration: InputDecoration(
                    labelText: 'Antecedents Medicaux',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.black12))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _txtdisease,
                keyboardType: TextInputType.multiline,
                maxLines: 9,
                validator: (val) =>
                    val!.isEmpty ? 'Problem is required ' : null,
                decoration: InputDecoration(
                    labelText: 'De quoi souffrez-vous?',
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
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

                    _createConsultation();
                  }
                },
                child: const Text('Enregistrer'),
              ),
            ),
          ],
        ),
      ),
        
        
        );
  }
}
