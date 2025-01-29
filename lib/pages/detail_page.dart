import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.imgurl,
      required this.name,
      required this.price,
      required this.shortDescription,
      required this.longDescription});

  final name;
  final imgurl;
  final price;
  final shortDescription;
  final longDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Detail page"),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.white,
            width: double.infinity,
            child: Image.asset("images/1.jpeg",fit: BoxFit.cover,),
            
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text(shortDescription),
                         Text("\$${price.toString()}",style: TextStyle(fontSize: 20),),
                        
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text(longDescription)
                   
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
