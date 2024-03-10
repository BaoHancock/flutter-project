import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stateperistancelogin/provider/userprovider.dart';
import 'package:stateperistancelogin/secret.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget { 
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
    bool? token=false;
  void  data ()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getBool("modified");
  
    print(token);
  }
@override
  void initState() {
   
    super.initState();
    data();

  }
   @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
        child: Center(child: Column(
          children: [Text(token.toString(),),
          
          ElevatedButton(onPressed: ()async{print(token);
          var email;
          http.Response res= await http.post(Uri.parse("$uri/signout"),headers: {'Content-Type':'application/json'},body:jsonEncode({"email":email,"token":token}));
          print(res.body);
          
          
          
          }, child: Text("Signout"))
            
          ],
        ),),
      ),
    );
  }
}
