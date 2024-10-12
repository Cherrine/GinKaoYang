import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/login_screen.dart';
import 'package:ginkhaoyang/utils/app_colors.dart';

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
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GinKhaoYang'),
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0, // removes shadow below the app bar
      ),
      body: const Stack(
        children: [
          // Your page content goes here
          LoginScreen(),
        ],
      ),
    );
  }
}
