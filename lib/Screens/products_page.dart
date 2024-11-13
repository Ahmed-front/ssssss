
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ProductProvider.dart';
import 'details_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),
      body: Consumer<ProductsProviders>(builder: (context, obj, child) {
        if (obj.productModel == null) {
          obj.fetchApi();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
            itemCount: obj.productModel?.model.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
               crossAxisSpacing: 20,
               mainAxisSpacing: 50,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage(index: index,),)
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(obj.productModel?.model[index]["image"], height: 90,),
                      Text(obj.productModel?.model[index]["name"]),
                      Text("${obj.productModel?.model[index]["price"]}"),
                    ],
                  ),
                ),
              );
            },
        );
      },),
    );
  }
}
