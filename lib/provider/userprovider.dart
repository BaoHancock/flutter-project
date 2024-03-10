import 'package:flutter/material.dart';
import 'package:stateperistancelogin/modellogin.dart';

class User extends ChangeNotifier{
  Users _user = Users(email: "", password: "", token: "");
  Users get user =>_user;

  void setUser ( String user ){
    _user = Users.fromJson(user);
    notifyListeners();

}
}
class MyData with ChangeNotifier {
  String _someValue = 'Default Value';

  String get someValue => _someValue;

  void updateValue(String newValue) {
    _someValue = newValue;
    notifyListeners();
  }

}