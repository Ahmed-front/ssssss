import 'package:ahmed/Screens/products_page.dart';
import 'package:ahmed/Screens/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/AuthProvider.dart';
import '../Services/AuthServices.dart';
import '../Widgets/custom_formfield.dart';

class SignIn extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  var formKey = GlobalKey<FormState>();
  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<ProductsProvider2>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/img.jpg"),),
            CustomFormfield(
              icon: Icon(Icons.email),
                textController: email,
                label: "Email",
            ),
            CustomFormfield(
              icon: Icon(Icons.lock),
              textController: pass,
              label: "Password",
            ),
            MaterialButton(
              onPressed: () async{
                await obj.login(pass: pass.text, email: email.text);
                if (formKey.currentState!.validate() && obj.status == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductsPage(),)
                    );
                } else {
                  print("false");
                }
              },
              color: Colors.tealAccent,
              child: Text("login"),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterationPage(),)
                );
              },
              child: Text("sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
