import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> listItems = [];

  // Add an item to the cart
  void addItem(CartItem item) {
    // Check if item already exists, increment quantity if so
    var existingItem = listItems.firstWhere(
      (cartItem) => cartItem.id == item.id,
      orElse: () => CartItem(id: '', name: '', price: 0, shortDescription: '', imgUrl: '', quantity: 0),
    );
    
    if (existingItem.id == '') {
      listItems.add(item);  // If item doesn't exist, add it
    } else {
      existingItem.quantity++;  // If item exists, increment quantity
    }
    notifyListeners();  // Notify listeners when the list is updated
  }

  // Delete an item from the cart by index
  void deleteItem(int index) {
    if (index >= 0 && index < listItems.length) {
      listItems.removeAt(index);
      notifyListeners();  // Notify listeners when the list is updated
    }
  }

  // Delete an item from the cart by id
  void deleteItemById(String id) {
    listItems.removeWhere((item) => item.id == id);
    notifyListeners();  // Notify listeners when the list is updated
  }

  // Increment the quantity of an item by id
  void incrementItem(String id) {
    var item = listItems.firstWhere(
      (cartItem) => cartItem.id == id,
      orElse: () => CartItem(id: '', name: '', price: 0, shortDescription: '', imgUrl: '', quantity: 0),
    );
    
    if (item.id != '') {
      item.quantity++;
      notifyListeners();  // Notify listeners when the quantity is updated
    }
  }

  // Decrement the quantity of an item by id
  void decrementItem(String id) {
    var item = listItems.firstWhere(
      (cartItem) => cartItem.id == id,
      orElse: () => CartItem(id: '', name: '', price: 0, shortDescription: '', imgUrl: '', quantity: 0),
    );
    
    if (item.id != '' && item.quantity > 1) {
      item.quantity--;
      notifyListeners();  // Notify listeners when the quantity is updated
    }
  }
}

class CartItem {
  String id;
  String name;
  double price;
  String shortDescription;
  String imgUrl;
  int quantity;
 

  CartItem({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.shortDescription,
    this.quantity = 1,

  });
}

