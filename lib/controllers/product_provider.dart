import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/constant.dart';
import 'package:flutter_project/models/productModel.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier { 
 
 Future<List<Productmodel>> getProduct() async {
  List<Productmodel> listProduct = [];

  try {
    var response = await http.get(Uri.parse(Url + "product"));

    if (response.statusCode == 200) {
      print("API Response: ${response.body}"); // Debugging line

      var decodedData = jsonDecode(response.body);

      if (decodedData is List) {
        for (var element in decodedData) {
          listProduct.add(Productmodel.fromJson(element));
        }
      } else {
        print("Unexpected API response format");
      }
    } else {
      print("API Error: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    print("Error fetching products: $e");
  }

  return listProduct;
}

}
