import 'package:flutter/material.dart';
import 'package:stateperistancelogin/auth/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  String token = "false";
  AuthService authService = AuthService();

  void loginuser(){
    authService.Login(email.text, password.text, token,context);
    print(password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

       
        TextField(controller:email ,),
        TextField(controller:password ,),
        ElevatedButton(onPressed: (){
          loginuser();
        }, child: Text("login"))
      ],),
    );
  }
}
