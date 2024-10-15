// sidebar.dart
import 'package:flutter/material.dart';
import 'package:ginkhaoyang/screens/login_screen.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';

class Sidebar extends StatefulWidget {
  final bool isPermanent;
  final Function(String) onNavigate; // Callback to handle navigation

  const Sidebar({
    super.key,
    this.isPermanent = false,
    required this.onNavigate, // Accept the callback
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
                  _buildMenuItem(Icons.history, "Order History", "order_history"),
                  // Add more menu items here
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
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: _toggleSidebar,
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: AnimatedOpacity(
          opacity: isCollapsed ? 0 : 1,
          duration: const Duration(milliseconds: 200),
          child: Text(
            'GinKhaoYang',
            style: montserratStyle.copyWith(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _handleLogout,
          ),
          AnimatedOpacity(
            opacity: isCollapsed ? 0 : 1,
            duration: const Duration(milliseconds: 200),
            child: Text(
              'Logout',
              style: catamaranStyle.copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String routeName) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: AnimatedOpacity(
        opacity: isCollapsed ? 0 : 1,
        duration: const Duration(milliseconds: 200),
        child: Text(
          title,
          style: hindMaduraiStyle.copyWith(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () {
        _navigateTo(routeName); // Call navigation on tap
      },
      hoverColor: Colors.white24,
    );
  }

  void _toggleSidebar() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  void _navigateTo(String routeName) {
    widget.onNavigate(routeName); // Call the callback with the route name
    if (isCollapsed) {
      _toggleSidebar(); // Toggle sidebar if collapsed
    }
  }

  void _handleLogout() {
    // Here you should clear the user session, e.g., remove tokens
    // For example, if you're using shared preferences:
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('token'); // or whatever key you are using

    // Navigate back to the LoginScreen
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }
}
