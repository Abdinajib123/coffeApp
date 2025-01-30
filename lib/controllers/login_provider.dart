import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/constant.dart';
import 'package:flutter_project/pages/dashboard.dart';
import 'package:flutter_project/widgets/bottonNav.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  String? _email;
  String? _password;

  String get email => _email!;
  String get password => _password!;

  getemail(String email) {
    _email = email;
    notifyListeners();
  }

  getpassword(String password) {
    _password = password;
    notifyListeners();
  }

  login(BuildContext context) async {
    try{var date = <String, dynamic>{"email": email, "password": password};

    var response = await http.post(
      Uri.parse(Url + "users/login"),
      body: jsonEncode(date),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => bottonNav(),
        ),
      );
    }else{
      print(response.body);
    }}catch(e){print(e);}
  }
}
