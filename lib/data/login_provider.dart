import 'package:flutter/material.dart';

class LoginProvider  extends ChangeNotifier{
  String? _email;
  String? _password;

  String get email=>_email!;
  String get password=>_password!;

  getemail(String email){
    _email=email;
    notifyListeners();
  }

  getpassword(String password){
    _password=password;
    notifyListeners();
  }

  login()async{
    var date=<String,dynamic>{
      "email":email,
      "password":password
    };
  }
}