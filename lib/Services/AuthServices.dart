import 'package:dio/dio.dart';

import '../Models/LoginModel.dart';

class PostData {
  static Dio dio = Dio();
  static post({required email, required pass, name, phone}) async {
    Response response = await dio.post(
        "https://student.valuxapps.com/api/register",
        data: {
          "name": name,
          "password": pass,
          "email":email,
          "phone": phone
        }
    );
    return Login.fromJson(response.data);
  }
  static login({required email, required pass}) async {
    Response response = await dio.post(
        "https://student.valuxapps.com/api/login",
        data: {
          "password" : pass,
          "email" : email
        }
    );
    return Login.fromJson(response.data);
  }
}