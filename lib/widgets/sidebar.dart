import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/login_screen.dart';

class Sidebar extends StatefulWidget {
  final bool isPermanent;
  final Function(String) onNavigate;

  const Sidebar({
    super.key,
    this.isPermanent = false,
    required this.onNavigate,
  });

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isCollapsed ? 70 : 250,
        color: Colors.grey[900],
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(Icons.home, "Home", "home"),
                  _buildMenuItem(
                      Icons.history, "Order History", "order_history"),
                ],
              ),
            ),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 80,
      color: Colors.black,
      child: Row(
        children: [
          if (isCollapsed) _buildMenuIcon(),
          if (!isCollapsed) _buildHeaderTitle(),
        ],
      ),
    );
  }

  Widget _buildMenuIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {
          setState(() {
            isCollapsed = !isCollapsed;
          });
        },
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Image.asset(
        'assets/images/namedlogo.png',
        height: 30, // Adjusted height for the logo
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: isCollapsed
          ? null
          : Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        widget.onNavigate(route);
      },
    );
  }

  Widget _buildLogoutButton() {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.white),
      title: isCollapsed
          ? null
          : const Text("Logout", style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
    );
  }
}