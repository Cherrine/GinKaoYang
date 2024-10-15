import 'package:flutter/material.dart';
import 'package:ginkhaoyang/widgets/side_menu.dart'; // Import the SideMenu

class SiteLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
      ),
      drawer: Drawer(
        child: SideMenu(), // Add your SideMenu here
      ),
      body: Center(
        child: Text("Main Content Here"), // Replace with your main content widget
      ),
    );
  }
}
