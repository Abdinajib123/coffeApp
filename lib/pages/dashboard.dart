import 'package:flutter/material.dart';
import 'package:flutter_project/data/data.dart';
import 'package:flutter_project/widgets/bottonNav.dart';
import 'package:flutter_project/widgets/cards.dart';
import 'package:flutter_project/widgets/chips.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                color: Color(0xff38220f),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 50),
                      child: Text(
                        'Hi Cabdinho',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Lets find Your',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      'favorite Coffe',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15, top: 17),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: ' Search',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chip(
                      label: Text(
                        'All',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      backgroundColor: Color(0xff38220f),
                      clipBehavior: Clip.none,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    chips(title: 'Hot Coffe'),
                    chips(title: 'cappuccino'),
                    chips(title: 'could Coffe'),
                    chips(title: 'latto Coffe'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 200),
              itemCount: productItems.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return cards(
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottonNav(),
    );
  }
}