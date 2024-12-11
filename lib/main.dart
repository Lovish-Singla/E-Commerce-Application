import 'package:ecom_fakestoreapi/about/about.dart';
import 'package:ecom_fakestoreapi/screens/home.dart';
import 'package:ecom_fakestoreapi/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:ecom_fakestoreapi/screens/categoryProducts.dart';
import 'package:ecom_fakestoreapi/screens/allProducts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/products': (context) {
          final category = ModalRoute.of(context)!.settings.arguments as String;
          return CategoryProducts(category: category);
        },
        '/allproducts': (context) => const AllProducts(),
      },
    );
  }
}
