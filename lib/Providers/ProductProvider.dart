import 'package:flutter/material.dart';

import '../Models/ProductModel.dart';
import '../Services/products_services.dart';

class ProductsProviders extends ChangeNotifier {
  ProductModel? productModel;
  fetchApi() async {
    productModel = await ProductsServices.getAll();
    notifyListeners();
  }
}