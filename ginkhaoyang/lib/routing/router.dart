import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/home_screen.dart'; // Import your HomeScreen
import 'package:ginkhaoyang/screens/login_screen.dart';
import 'package:ginkhaoyang/screens/order_history_screen.dart'; // Import your OrderHistoryScreen
import 'package:ginkhaoyang/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute: // Assuming you define homePageRoute in your routes
      return _getPageRoute(const HomeScreen());
    case orderHistoryPageRoute: // Assuming you define orderHistoryPageRoute in your routes
      return _getPageRoute(const OrderHistoryScreen());
    case authenticationPageRoute: // Assuming you define orderHistoryPageRoute in your routes
      return _getPageRoute(const LoginScreen());
    default:
      return _getPageRoute(const HomeScreen()); // Default to HomeScreen
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
