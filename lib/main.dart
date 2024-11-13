import 'package:flutter/material.dart';
import 'Providers/ProductProvider.dart';
import 'Providers/AuthProvider.dart';
import 'Screens/registeration_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProviders(),),
        ChangeNotifierProvider(create: (context) => ProductsProvider2(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'tamer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RegisterationPage(),
      ),
    );
  }
}

