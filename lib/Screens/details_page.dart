import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ProductProvider.dart';

class DetailsPage extends StatelessWidget {
  final index;
  const DetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
      ),
      body: Container(
        child: Consumer<ProductsProviders>(builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(value.productModel?.model[index]["image"]),
              Text(value.productModel?.model[index]["name"]),
              Text("${value.productModel?.model[index]["price"]}"),
              Text("${value.productModel?.model[index]["price"]}"),
            ],
          );
        },)
      ),
    );
  }
}
