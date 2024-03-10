import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stateperistancelogin/homescreen.dart';
import 'package:stateperistancelogin/login.dart';
import 'package:stateperistancelogin/provider/userprovider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_)=>MyData(),child: const MyApp()));
}
 bool token=false;
class MyApp extends StatefulWidget {
  
  const MyApp({super.key});
 
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  


  void  data ()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    token  = pref.getBool("modified")!;
    
   print(token);
    
  }
  @override
  void initState() {
    //
    super.initState(); 
    data();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:token ?Homescreen():const Login(),
    );
  }
}
