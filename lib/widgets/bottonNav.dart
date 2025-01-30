import 'package:flutter/material.dart';
import 'package:flutter_project/pages/dashboard.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:flutter_project/pages/orderpage.dart';
import 'package:flutter_project/pages/profile_page.dart';
import 'package:flutter_project/pages/search.dart';

class bottonNav extends StatefulWidget {
  bottonNav({
    super.key,
  });

  @override
  State<bottonNav> createState() => _bottonNavState();
}

class _bottonNavState extends State<bottonNav> {
  @override
  int curentindex = 0;

  List<Widget> _pagesdisplays = [
    Dashboard(),
    Orderpage(),
    Search(),
    Home(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: _pagesdisplays[curentindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curentindex,
          onTap: (value) {
            setState(() {
              curentindex = value;
            });
          },
          selectedItemColor: Color(0xff38220f),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: GestureDetector(onTap: () {}, child: Icon(Icons.home)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: () {}, child: Icon(Icons.card_giftcard)),
                label: 'Cards'),
            BottomNavigationBarItem(
                icon: GestureDetector(onTap: () {}, child: Icon(Icons.search)),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: GestureDetector(onTap: () {}, child: Icon(Icons.logout)),
                label: 'logout'),
          ]),
    );
  }
}
