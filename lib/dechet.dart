               /* margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Icon(
                      Icons.mic_none,
                      color: Colors.grey,
                    ),
                  ],
                ),
               import 'package:flutter/material.dart';
               void main()
               {
                 runApp(MyApp());
               }
               class MyApp extends StatelessWidget {
                 @override
                 Widget build(BuildContext context) {
                   return MaterialApp(
                     title: 'Flutter Datepicker',
                     theme: ThemeData(
                       primarySwatch: Colors.blue,
                     ),
                     home: MyHomePage(),
                   );
                 }
               }

               class MyHomePage extends StatefulWidget {
                 @override
                 _MyHomePageState createState()
                 {
                   return _MyHomePageState();
                 }
               }

               class _MyHomePageState extends State<MyHomePage> {
                 String date = "";
                 DateTime selectedDate = DateTime.now();
                 @override
                 Widget build(BuildContext context) {
                   return Scaffold(
                     appBar: AppBar(
                       title: Text("Flutter Datepicker"),
                     ),
                     body: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           ElevatedButton(
                             onPressed: () {
                               _selectDate(context);
                             },
                             child: Text("Choose Date"),
                           ),
                           Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
                         ],
                       ),
                     ),
                   );
                 }

                 _selectDate(BuildContext context) async {
                   final DateTime selected = await showDatePicker(
                     context: context,
                     initialDate: selectedDate,
                     firstDate: DateTime(2010),
                     lastDate: DateTime(2025),
                   );
                   if (selected != null && selected != selectedDate)
                     setState(() {
                       selectedDate = selected;
                     });
                 }
               }*/
               /*InkWell(
               child: Container(......),
               onTap: () {
               print("Click event on Container");
               },
               );

               Row(
               children: <Widget>[
               Container(
               height: 20,
               width: 116,
               child: ListTile(
               title: Text("Mr"),
               leading: Radio(
               value: 1,
               groupValue: val,
               onChanged: (value_radio) {
               setState(() {
               val = value_radio as int;
               });
               },
               activeColor: Color(0xFF00BCD4),
               ),
               ),
               ),
               Container(
               height: 20,
               width: 134,
               child: ListTile(
               title: Text("Mme"),
               leading: Radio(
               value: 2,
               groupValue: val,
               onChanged: (value_radio) {
               setState(() {
               val = value_radio as int;
               });
               },
               activeColor: Color(0xFF00BCD4),
               ),
               ),
               ),
               ]),

               DropdownButton(

               // Initial Value
               value: dropdownvalue,

               // Down Arrow Icon
               icon: const Icon(Icons.keyboard_arrow_down),

               // Array list of items
               items: items.map((String items) {
               return DropdownMenuItem(
               value: items,
               child: Text(items),
               );
               }).toList(),
               // After selecting the desired option,it will
               // change button value to selected value
               onChanged: (String? newValue) {
               setState(() {
               dropdownvalue = newValue!;
               });
               },
               )



                 //error variable
  String password_error = "";
  String name_error = "";
  String email_error = "";
  String re_password_error = "";
  String surname_error = "";
  String date_birth_error = "";
  String phone_error = "";
  String sexe_error = "";

  //normal variable
  bool value_radio = false;
  int val = -1;
  String value = "";
  String name = "";
  String password = "";
  String surname = "";
  String phone = "";
  String re_password = "";
  String date_birth = "";
  bool _isLoading = false;
  var body;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();
  TextEditingController re_passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formkey = new GlobalKey<FormState>();
  // Initial Selected Value
  String sexe = 'Homme';
  // List of items in our dropdown menu
  var items = ['Homme', 'Femme'];
  String date = "";
  DateTime selectedDate = DateTime.now();

  register() async {
    var formData ={
      'email': emailController.text,
      'password': passwordController.text,
      're_password': re_passwordController.text,
      'phone': phoneController.text,
      'name': nameController.text,
      'surname': surnameController.text,
      'date_birth': date_birth,
      'sexe': sexe,
    };
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      formkey.currentState!.reset();
    }
    setState((){
      _isLoading = true;
    });
    try {
      print(formData);
      var response = await CallApi().postDate(formData, "register");
      setState((){
        body = jsonDecode(response.body);
      });
      print(body["errors"]);
      if(body["statut"]== true){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginPage()),
        );
        setState((){
          _isLoading = false;
        });
      }else{
        setState((){
          _isLoading = false;
          password_error = body['errors']['password'][0];
          re_password_error = body['errors']['re_password'][0];
          name_error = body['errors']['name'][0];
          surname_error = body['errors']['surname'][0];
          phone_error = body['errors']['phone'][0];
          sexe_error = body['errors']['sexe'][0];
          date_birth_error = body['errors']['date_birth'][0];
          email_error = body['errors']['email'][0];
        });
       // print(email_error);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body['errors']['email'][0]),
          duration: const Duration(seconds: 10),
        ));
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }



        ApiResponse response = await getUserDetail();
      if(response.error == null){

      }else if(response.error == "Unauthorized"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('{$response.error}')
        ));
      }
  */