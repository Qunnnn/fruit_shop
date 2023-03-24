import 'package:flutter/material.dart';
import 'package:fruit_shop/Modules/dashboard/provider/cart_provider.dart';
import 'package:fruit_shop/screens/home_screen.dart';
import 'package:fruit_shop/screens/intro_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => MyCart()),
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fruit Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  IntroScreen(),
      ),
    );
  }
}

