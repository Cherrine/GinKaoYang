import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ginkhaoyang/controllers/menu_controller.dart'
    as menu_controller;
import 'package:ginkhaoyang/controllers/navigation_controller.dart';
import 'package:ginkhaoyang/screens/home_screen.dart'; // Import the screens
import 'package:ginkhaoyang/screens/order_history_screen.dart';
import 'package:ginkhaoyang/screens/login_screen.dart';
import 'package:ginkhaoyang/screens/not_found_screen.dart'; // Import a not-found page or create one
import 'package:ginkhaoyang/routing/routes.dart'; // Import your route constants

void main() {
  Get.put(menu_controller.MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: homePageRoute, // Set the initial route
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => const NotFoundScreen()), // Handle unknown routes
      getPages: [
        GetPage(
          name: homePageRoute,
          page: () => const HomeScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: orderHistoryPageRoute,
          page: () => const OrderHistoryScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: authenticationPageRoute,
          page: () => const LoginScreen(),
          transition: Transition.downToUp,
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
