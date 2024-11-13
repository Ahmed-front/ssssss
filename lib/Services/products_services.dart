import 'package:dio/dio.dart';

import '../Models/ProductModel.dart';

class ProductsServices {
  static Dio dio = Dio();
  static getAll() async {
    try {
      const url = "https://student.valuxapps.com/api/home";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}