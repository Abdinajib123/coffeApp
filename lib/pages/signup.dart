import 'package:flutter/material.dart';
import 'package:flutter_project/data/signup_provider.dart';
import 'package:flutter_project/pages/loginPage.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff290707), 
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
               
                children: [
                  Center(
                    child: CircleAvatar(
                            backgroundImage: AssetImage('images/1.jpeg'),
                            radius: 50,
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    margin: EdgeInsets.all( 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: TextField(
                      onChanged: (value)=>context.read<SignupProvider>().getname(value),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    margin: EdgeInsets.all( 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: TextField(
                      onChanged: (value)=>context.read<SignupProvider>().getemail(value),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                      Container(
                    padding: EdgeInsets.only(left: 8.0),
                    margin: EdgeInsets.all( 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: TextField(
                      onChanged: (value)=>context.read<SignupProvider>().getpassword(value),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(child: Container(
                        height: 60,
                        margin: EdgeInsets.all(12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                          ),
                          onPressed: ()=>context.read<SignupProvider>().register(context),
                           child: Text('Sign up',style: TextStyle(color: Colors.black,fontSize: 20),)),
                      ))
                    ],
                  ),
                
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}