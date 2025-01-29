import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:flutter_project/controllers/login_provider.dart';
import 'package:flutter_project/controllers/product_provider.dart';
import 'package:flutter_project/controllers/signup_provider.dart';
import 'package:flutter_project/pages/dashboard.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:flutter_project/pages/orderpage.dart';
import 'package:flutter_project/pages/search.dart';
import 'package:flutter_project/widgets/bottonNav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>CartProvider()),
    ChangeNotifierProvider(create: (_)=>SignupProvider()),
    ChangeNotifierProvider(
      create: (_) => LoginProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Orderpage(),
    );
  }
}
