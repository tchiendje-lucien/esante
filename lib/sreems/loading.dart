import 'package:flutter/material.dart';
import 'package:wash/services/user_service.dart';
import 'package:wash/sreems/api_response.dart';

import '../Home_page.dart';
import '../LoginPage.dart';

class loading extends StatefulWidget {
  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void loadUserInfo() async {
    String token = await getToken();
    if (token == "") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }else{
      ApiResponse response = await getUserDetail();
      if(response.error == null){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Home_page()),
        );
      }else if(response.error == "Unauthorized"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }else{
        print(response.error);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    }
  }

  @override
  void initState(){
    loadUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
