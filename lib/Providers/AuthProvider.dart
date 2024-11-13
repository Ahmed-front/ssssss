import 'package:flutter/material.dart';

import '../Models/LoginModel.dart';
import '../Services/AuthServices.dart';

class ProductsProvider2 extends ChangeNotifier {
  bool? status;
  signUp({required pass, name, required email, phone}) async {
    await PostData.post(email: email, pass: pass, name: name, phone: phone);
    notifyListeners();
  }
  login({required pass, required email}) async {
    Login mod = await PostData.login(email: email, pass: pass);
    status = mod.status;
    notifyListeners();
  }
}