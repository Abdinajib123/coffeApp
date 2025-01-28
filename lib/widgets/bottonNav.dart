import 'package:flutter/material.dart';

class bottonNav extends StatelessWidget {
  const bottonNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Color(0xff38220f),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: GestureDetector(onTap: () {}, child: Icon(Icons.home)),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: GestureDetector(onTap: () {}, child: Icon(Icons.list)),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {}, child: Icon(Icons.card_giftcard)),
              label: 'Cards'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ]);
  }
}
