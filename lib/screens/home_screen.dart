// home_screen.dart
import 'package:flutter/material.dart';
import 'package:ginkhaoyang/widgets/sidebar.dart';
import 'package:ginkhaoyang/widgets/responsive_widget.dart';
import 'package:ginkhaoyang/screens/order_history.dart'; // Import the Order History screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRoute = "home"; // Default route
  String appBarTitle = "Home"; // Default AppBar title

  // Example main content
  Widget _buildMainContent() {
    switch (selectedRoute) {
      case "home":
        return const Center(child: Text('Home Screen Content', style: TextStyle(fontSize: 24)));
      case "order_history":
        return const OrderHistoryScreen(); // Display the Order History screen
      // Add more cases for other routes as needed
      default:
        return const Center(child: Text('Select a Menu Item', style: TextStyle(fontSize: 24)));
    }
  }

  // Large screen layout with permanent sidebar
  Widget _buildLargeScreen(BuildContext context) {
    return Row(
      children: [
        Sidebar(
          isPermanent: true,
          onNavigate: (routeName) {
            setState(() {
              selectedRoute = routeName; // Update the selected route
              appBarTitle = routeName == "home" ? "Home" : "Order History"; // Update AppBar title
            });
          },
        ),
        Expanded(
          child: _buildMainContent(),
        ),
      ],
    );
  }

  // Medium and Small screen layout with Drawer
  Widget _buildDrawerScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle), // Use the dynamic AppBar title
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Sidebar(
        onNavigate: (routeName) {
          Navigator.of(context).pop(); // Close the drawer
          setState(() {
            selectedRoute = routeName; // Update the selected route
            appBarTitle = routeName == "home" ? "Home" : "Order History"; // Update AppBar title
          });
        },
      ),
      body: _buildMainContent(), // Default to home
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: _buildLargeScreen(context),
      mediumScreen: _buildDrawerScreen(context),
      smallScreen: _buildDrawerScreen(context),
    );
  }
}
