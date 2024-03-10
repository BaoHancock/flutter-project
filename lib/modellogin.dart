// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
 final String email;
 final String password;
 final String token ;

  Users({required this.email, required this.password, required this.token});
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'token':token,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      email: map['email'] as String,
      password: map['password'] as String,
      token: map[''] as String ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source) as Map<String, dynamic>);
}
