import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/cart_provider.dart';
import 'package:flutter_project/controllers/product_provider.dart';
import 'package:flutter_project/models/productModel.dart';
import 'package:flutter_project/pages/detail_page.dart';
import 'package:flutter_project/pages/see_all_page.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              color: Color(0xff38220f),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 50),
                  child: Row(
                    children: [
                      Icon(Icons.menu, color: Colors.white, size: 30),
                      Spacer(),
                      // Cart icon with item count
                      Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          return IconButton(
                            onPressed: () {
                              // Handle cart icon press (e.g., navigate to CartPage)
                            },
                            icon: Badge(
                              label: Text(
                                cartProvider.listItems.length.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Lets find Your',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    'favorite Coffe',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 17),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
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
                          labelText: 'Search',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular coffee',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SeeAllPage()),
                  ),
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Color(0xff38220f),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<Productmodel>>(
              future: context.read<ProductProvider>().getProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Filter the products based on the search query
                  List<Productmodel> filteredProducts = snapshot.data!
                      .where((product) =>
                          product.name!.toLowerCase().contains(_searchQuery) ||
                          product.shortDescription!
                              .toLowerCase()
                              .contains(_searchQuery))
                      .toList();

                  return GridView.builder(
                    itemCount: filteredProducts.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      var product = filteredProducts[index];
                      bool isAdded = context
                          .watch<CartProvider>()
                          .listItems
                          .any((item) => item.id == product.sId);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(
                                imgurl: product.image!,
                                name: product.name!,
                                price: product.price!,
                                shortDescription: product.shortDescription!,
                                longDescription: product.longDescription!,
                              ),
                            ),
                          );
                        },
                        child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            shortDescription:
                                                product.shortDescription!,
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
                                          borderRadius:
                                              BorderRadius.circular(250),
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
        ],
      ),
    );
  }
}
