import 'package:flutter/material.dart';
import 'package:flutter_project/data/data.dart';

class cards extends StatelessWidget {
  const cards({
    super.key,
    required this.index
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: .0,left: 15,right: 15,bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff6f6f6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image(
                    image: AssetImage(productItems[index].imgurl),
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 4.0,left: 8,right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productItems[index].title,
                          style: TextStyle(
                              fontSize: 18, color: Color(0xff290707),fontWeight: FontWeight.bold),
                        ),
                        Text(productItems[index].rating.toString(),style: TextStyle(color: Color(0xff290707),fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [Text(productItems[index].shortdescription,style: TextStyle(color: Color(0xff290707),fontWeight: FontWeight.bold),),
                       Text(productItems[index].price.toString(),style: TextStyle(color: Color(0xff290707),fontWeight: FontWeight.bold),)],
                    ),
                    SizedBox(height: 8,),
                    Container(
                      height: 32,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xff290707),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Icon(Icons.add,color: Colors.white,),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}