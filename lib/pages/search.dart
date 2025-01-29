import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:flutter_project/controllers/product_provider.dart';
import 'package:flutter_project/models/productModel.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff38220f),
      appBar: AppBar(
        title: Text('All Products', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5, offset: Offset(0, 3))],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Search for products',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Productmodel>>(
              future: context.read<ProductProvider>().getProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Filter products based on the search query
                  List<Productmodel> filteredProducts = snapshot.data!
                      .where((product) =>
                          product.name!.toLowerCase().contains(_searchQuery) ||
                          product.shortDescription!.toLowerCase().contains(_searchQuery))
                      .toList();

                  return GridView.builder(
                    itemCount: filteredProducts.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      var product = filteredProducts[index];
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
                              padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        product.name!,
                                        style: TextStyle(
                                            fontSize: 18, color: Color(0xff290707), fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        product.shortDescription!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Color(0xff290707), fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "\$${product.price}",
                                        style: TextStyle(color: Color(0xff290707), fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  IconButton(
                                    onPressed: () {
                                      if (!isAdded) {
                                        CartItem newItem = CartItem(
                                          id: product.sId!,
                                          name: product.name!,
                                          price: product.price!,
                                          shortDescription: product.shortDescription!,
                                          imgUrl: product.image!,
                                        );
                                        context.read<CartProvider>().addItem(newItem);
                                      } else {
                                        context.read<CartProvider>().deleteItemById(product.sId!);
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error loading products");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
