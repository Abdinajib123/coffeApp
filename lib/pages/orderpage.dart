import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:provider/provider.dart';

class Orderpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Order', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xff38220f), // Match the color to your image
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          double total = 0.0;
          // Calculate the total price
          cartProvider.listItems.forEach((item) {
            total += item.price * item.quantity;
          });

          return cartProvider.listItems.isEmpty
              ? Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
              : Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        itemCount: cartProvider.listItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartProvider.listItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  cartItem.imgUrl,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(cartItem.name, style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('⭐ ${cartItem.shortDescription}', style: TextStyle(fontSize: 12)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("\$${cartItem.price}", style: TextStyle(fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          // Subtract button with style
                                          IconButton(
                                            icon: Icon(Icons.remove, size: 20),
                                            style: IconButton.styleFrom(
                                              backgroundColor: Color(0xff38220f), // Background color
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(250), // Rounded button
                                              ),
                                            ),
                                            onPressed: () {
                                              cartProvider.decrementItem(cartItem.id);
                                            },
                                          ),
                                          // Quantity text
                                          Text(cartItem.quantity.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                          // Add button with style
                                          IconButton(
                                            icon: cartItem.isAdded ? Icon(Icons.check, size: 20) : Icon(Icons.add, size: 20),
                                            style: IconButton.styleFrom(
                                              backgroundColor: Color(0xff38220f), // Background color
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(250), // Rounded button
                                              ),
                                            ),
                                            onPressed: () {
                                              cartProvider.incrementItem(cartItem.id);
                                              cartItem.isAdded = !cartItem.isAdded;
                                              cartProvider.notifyListeners();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cartProvider.deleteItemById(cartItem.id);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total: \$${total.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff38220f)),
                            ),
                            SizedBox(height: 10),
                            Text('Shipping Charges: \$0.00', style: TextStyle(fontSize: 16)),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xff38220f),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Place Order',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
