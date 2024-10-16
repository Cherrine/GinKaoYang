import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
      ),
      home: const LoginScreen(), // Set HomePage as the home
      debugShowCheckedModeBanner: false,
    );
  }
}
