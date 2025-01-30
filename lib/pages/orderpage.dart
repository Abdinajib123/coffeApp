import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:provider/provider.dart';

class Orderpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff38220f),
      appBar: AppBar(
        title: Text('Review Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            double total = 0.0;
            // Calculate the total price
            cartProvider.listItems.forEach((item) {
              total += item.price * item.quantity;
            });

            return cartProvider.listItems.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ListView.builder(
                          itemCount: cartProvider.listItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartProvider.listItems[index];
                            return Card(
                              margin:
                                  EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                              child: Container(
                                height: 100, // Set a fixed height for the card
                                child: Row(
                                  children: [
                                    // Image Section
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      child: Container(
                                        width: 100,
                                        height: 100, // Match card height
                                        child: Image.network(
                                          cartItem.imgUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Product Details Section
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItem.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(cartItem.shortDescription),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("\$${cartItem.price}"),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: () {
                                                        cartProvider.decrementItem(
                                                            cartItem.id);
                                                      },
                                                    ),
                                                    Text(cartItem.quantity.toString()),
                                                    IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        cartProvider.incrementItem(
                                                            cartItem.id);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Delete Button
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        cartProvider.deleteItemById(cartItem.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Total price & Checkout section
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15, top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total: \$${total.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Shipping Charges: \$0.00',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Show an alert dialog when button is pressed
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Order Placed'),
                                        content: Text(
                                            'You have placed your order successfully'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text('Place Order',style: TextStyle(   color: Color(0xff38220f),),),
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(double.infinity, 60), // Button size
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
