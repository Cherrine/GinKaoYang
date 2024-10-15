import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(context, 'Home', Icons.home),
          _buildNavItem(context, 'Search', Icons.search),
          _buildNavItem(context, 'Orders', Icons.receipt),
          _buildNavItem(context, 'Profile', Icons.person),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        // Handle navigation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigating to $title')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}