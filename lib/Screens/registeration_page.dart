import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/AuthProvider.dart';
import '../Widgets/custom_formfield.dart';
import 'login_page.dart';

class RegisterationPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  RegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<ProductsProvider2>(context, listen: false);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Signup"),
        centerTitle: true,
        actions: const [
          Icon(Icons.settings)
        ],
      ),
      body: Form(
        key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomFormfield(
                icon: Icon(Icons.account_circle),
                  textController: name,
                  label: "Name",
              ),
              CustomFormfield(
                icon: Icon(Icons.phone),
                textController: phone,
                label: "phone",
              ),
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await obj.signUp(pass: pass.text, email: email.text, phone: phone.text, name: name.text);
                    if (obj.status == true) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn(),)
                      );
                    } else {
                        print("failed");
                      }
                  }
                },
                color: Colors.tealAccent,
                child: Text("Add a new user"),
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn(),)
                  );
                },
                color: Colors.teal,
                child: Text("login"),
              )
            ],
          )
      )
    );
  }
}
