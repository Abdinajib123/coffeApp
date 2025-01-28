import 'package:flutter/material.dart';
import 'package:flutter_project/pages/loginPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff290707),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/1.jpeg'),
                radius: 50,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  'Find the best coffe ',
                  style: TextStyle(color: Colors.white, fontSize: 38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'for you ',
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>Loginpage(),));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      color: Color(0xff38220f),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        
      );
  }
}