import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/constant.dart';
import 'package:flutter_project/pages/loginPage.dart';
import 'package:http/http.dart' as http;

class SignupProvider extends ChangeNotifier {
  String? _name;
  String? _email;
  String? _password;

  String get name => _name!;
  String get email => _email!;
  String get password => _password!;

  getname(String name) {
    _name = name;
    notifyListeners();
  }

  getemail(String email) {
    _email = email;
    notifyListeners();
  }

  getpassword(String password) {
    _password = password;
    notifyListeners();
  }

  register(BuildContext context) async {
  try{
      var date = <String, dynamic>{
      "name": name,
      "email": email,
      "password": password
    };

    var response = await http.post(
      Uri.parse(Url + "users"),
      body: jsonEncode(date),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Loginpage(),
        ),
      );
    }else{
      print("error occur");
    }
  }catch(e){
    print(e);
  }
  }
}
