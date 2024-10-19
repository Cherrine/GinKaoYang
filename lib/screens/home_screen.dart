import 'package:flutter/material.dart';
import 'package:ginkhaoyang/widgets/sidebar.dart';
import 'package:ginkhaoyang/screens/order_history.dart';
import 'package:ginkhaoyang/utils/menu_items.dart' as menu_items;
import 'package:ginkhaoyang/components/item_card.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRoute = "home";
  List<String> recentOrders = [];

  void addOrder(String order) {
    setState(() {
      // Add order only if it's not already in the list
      if (!recentOrders.contains(order)) {
        recentOrders.add(order);
      }
    });
  }

  Widget _buildMainContent() {
    switch (selectedRoute) {
      case "home":
        return Column(
          children: [
            _buildHeader(), // Include the header at the top
            Expanded(child: _buildPopularItems()), // Make the items expand
          ],
        );
      case "order_history":
        return OrderHistoryScreen(orders: recentOrders);
      default:
        return const Center(child: Text('Select a Menu Item'));
    }
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16), // Space between header and items
      child: Stack(
        alignment: Alignment.bottomLeft, // Align text to the bottom left
        children: [
          // Banner Image
          Image.asset(
            'assets/images/food_banner.jpeg',
            fit: BoxFit.cover, // Adjust the fit as needed
            width: double.infinity, // Make the image full width
            height: 150, // Set a fixed height for the banner
          ),
          Container(
            color: Colors.black54, // Semi-transparent background for overlay
            width: double.infinity,
            height: 150, // Match the height of the image
          ),
          // Text overlay
          Container(
            padding: const EdgeInsets.all(8), // Padding around the text
            child: Text(
              "What will you order today?",
              style: montserratStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text for contrast
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItems() {
    final popularItems = menu_items.popularItems;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: popularItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final item = popularItems[index];
        return ItemCard(
          title: item['title'],
          description: item['description'],
          price: item['price'],
          image: item['image'],
          onOrderConfirmed: addOrder,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            isPermanent: true,
            onNavigate: (route) {
              setState(() {
                selectedRoute = route;
              });
            },
          ),
          Expanded(child: _buildMainContent()),
        ],
      ),
    );
  }
}
