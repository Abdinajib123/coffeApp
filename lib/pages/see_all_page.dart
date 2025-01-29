import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:flutter_project/controllers/product_provider.dart';
import 'package:flutter_project/models/productModel.dart';
import 'package:provider/provider.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Expanded(
        child: FutureBuilder<List<Productmodel>>(
          future: context.read<ProductProvider>().getProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15),
                itemBuilder: (context, index) {
                  var product = snapshot.data![index];

                  // Check if the product is already added to the cart
                  bool isAdded = context
                      .watch<CartProvider>()
                      .listItems
                      .any((item) => item.id == product.sId);

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xfff6f6f6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(
                            product.image!,
                            height: 90,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff290707),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.shortDescription!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xff290707),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$${product.price}",
                                    style: TextStyle(
                                        color: Color(0xff290707),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              IconButton(
                                onPressed: () {
                                  // If item is not added, add it to the cart
                                  if (!isAdded) {
                                    CartItem newItem = CartItem(
                                      id: product.sId!,
                                      name: product.name!,
                                      price: product.price!,
                                      shortDescription: product.shortDescription!,
                                      imgUrl: product.image!,
                                    );
                                    context
                                        .read<CartProvider>()
                                        .addItem(newItem);
                                  } else {
                                    // If item is already added, toggle it (remove from cart)
                                    context
                                        .read<CartProvider>()
                                        .deleteItemById(product.sId!);
                                  }
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Color(0xff38220f),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(250),
                                  ),
                                ),
                                icon: Icon(
                                  isAdded ? Icons.check : Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Error loading products");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
