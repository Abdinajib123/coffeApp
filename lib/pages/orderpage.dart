import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Order'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          double total = 0.0; // To calculate the total price
          // Loop through all items to calculate the total price
          cartProvider.listItems.forEach((item) {
            total += item.price * item.quantity;
          });

          return cartProvider.listItems.isEmpty
              ? Center(child: Text('Your cart is empty'))
              : Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        itemCount: cartProvider.listItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartProvider.listItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: ListTile(
                              leading: Image.network(
                                cartItem.imgUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              title: Text(cartItem.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('⭐ ${cartItem.shortDescription}'),
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
                                              cartProvider
                                                  .decrementItem(cartItem.id);
                                            },
                                          ),
                                          Text(cartItem.quantity.toString()),
                                          IconButton(
                                            icon: cartItem.isAdded
                                                ? Icon(Icons.check)
                                                : Icon(Icons.add),
                                            onPressed: () {
                                              cartProvider.incrementItem(
                                                  cartItem.id);
                                              cartItem.isAdded =
                                                  !cartItem.isAdded; // Toggle the state
                                              cartProvider.notifyListeners(); // Notify listeners for the update
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Directly call deleteItemById with cartItem.id
                                  cartProvider.deleteItemById(cartItem.id);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Second Expanded widget for the price details
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total: \$${total.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text('Shipping Charges: \$0.00'),
                            SizedBox(height: 10),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Handle the place order action
                              },
                              child: Text('Place Order'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 45),
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
    );
  }
}
