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
               )*/