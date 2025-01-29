// import 'package:flutter/material.dart';
// import 'package:flutter_project/pages/dashboard.dart';  // Import Dashboard
// import 'package:flutter_project/pages/orderpage.dart';
// import 'package:flutter_project/pages/search.dart';
// import 'package:flutter_project/pages/profile_page.dart';  // Import ProfilePage

// class Bottonnav extends StatefulWidget {
//   const Bottonnav({super.key});

//   @override
//   _BottonnavState createState() => _BottonnavState();
// }

// class _BottonnavState extends State<Bottonnav> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     // Placeholder text for each tab's page
//     Text('Home Page'),
//     Text('Cart Page'),
//     Text('Search Page'),
//     Text('Profile Page'),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });

//     // Navigate based on the selected index
//     if (index == 0) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Dashboard()),  // Navigate to the Dashboard page
//       );
//     } else if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Orderpage()),  // Navigate to the OrderPage
//       );
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Search()),  // Navigate to the SearchPage
//       );
//     } else if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ProfilePage()),  // Navigate to the ProfilePage
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _pages[_currentIndex],  // This just shows text for now, replace with actual pages
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onItemTapped,  // Trigger navigation on tab change
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
