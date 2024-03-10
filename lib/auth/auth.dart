import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import "package:stateperistancelogin/errorhandle/httperrorhandle.dart";
import "package:stateperistancelogin/homescreen.dart";
import "package:stateperistancelogin/loadingbar.dart";
import "package:stateperistancelogin/secret.dart";

class AuthService{


  void Login (
    String email,
    String password,
    String token,
  BuildContext context
  )async {
    try{
        http.Response res = await http.post(Uri.parse("$uri/login"),headers: {'Content-Type':'application/json'},body:jsonEncode({"email":email,"password":password,"token":token}));
        print(password);
        print(res.body);
        
        bool modified =jsonDecode(res.body)["token"];
        print(modified);

        httperrorhande(modified: modified, onsuccess: ()async{
          SharedPreferences pref= await SharedPreferences.getInstance();
          pref.setBool("modified",true);
          print(pref.getBool("modified"));
          print("below setbool");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Entrances(),));

        });
        
    }catch(e){
          print(e);
          print("catchbloxk");
    }

  }

  
}