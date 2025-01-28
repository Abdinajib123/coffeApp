import 'package:flutter/material.dart';
import 'package:flutter_project/pages/loginPage.dart';

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
                      
                      decoration: InputDecoration(
                        labelText: 'Username',
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
                          onPressed: ()=>{
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>Loginpage(),)) 
                          }, child: Text('Sign up',style: TextStyle(color: Colors.black,fontSize: 20),)),
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