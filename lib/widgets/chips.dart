import 'package:flutter/material.dart';

class chips extends StatelessWidget {
  const chips({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(label: Text(title,style: TextStyle(color: Color(0xff290707),fontWeight: FontWeight.bold,fontSize: 17),),
            backgroundColor:Color(0xfff6f6f6) ,
            clipBehavior:Clip.none ,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            
            ),
    );
  }
}
