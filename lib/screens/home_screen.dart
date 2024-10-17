// home_screen.dart
import 'package:flutter/material.dart';
import 'package:ginkhaoyang/utils/app_styles.dart';
import 'package:ginkhaoyang/widgets/sidebar.dart';
import 'package:ginkhaoyang/widgets/responsive_widget.dart';
import 'package:ginkhaoyang/screens/order_history.dart';
import 'package:ginkhaoyang/components/item_card.dart'; // Import the ItemCard component
import 'package:ginkhaoyang/utils/menu_items.dart'
    as menuItems; // Import the menu items list

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRoute = "home"; // Default route
  String appBarTitle = "Home"; // Default AppBar title

  late List<Map<String, dynamic>> popularItems; // Declare popularItems as late

  @override
  void initState() {
    super.initState();
    popularItems = menuItems
        .popularItems; // Initialize popularItems directly from the imported file
  }

  // Widget to display the popular items
  Widget _buildPopularItems() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(       
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Our Menu',
            style: montserratStyle.copyWith(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;
              int crossAxisCount = width > 1200
                  ? 6
                  : width > 800
                      ? 4
                      : 2;
              double aspectRatio = width > 600 ? 0.8 : 0.7;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: popularItems.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                    title: popularItems[index]['title'],
                    description: popularItems[index]['description'],
                    price: popularItems[index]['price'],
                    image: popularItems[index]['image'],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget to create the banner
  Widget _buildBanner() {
    return Stack(
      children: [
        // Background image
        Image.asset(
          'assets/images/food_banner.jpeg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 250, // Set a fixed height to make it consistent
        ),
        // Fade effect
        Container(
          height: 250, // Same height as the image
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black54, // Black with opacity
                Colors.transparent, // Transparent
              ],
              begin: Alignment.bottomCenter, // Start from bottom
              end: Alignment.topCenter, // Fade upwards
            ),
          ),
        ),
        // Text overlay
        Positioned(
          left: 20,
          bottom: 30, // Keep some space from the bottom of the banner
          child: Text(
            "What will you order today?",
            style: montserratStyle.copyWith(
              // Apply your custom style
              color: Colors.white, // White text color
              fontSize: 24, // Font size
              fontWeight: FontWeight.bold, // Bold font weight
            ),
          ),
        ),
      ],
    );
  }


  // Example main content
  Widget _buildMainContent() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            background: _buildBanner(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Navigate to cart or other functionality
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                // Navigate to profile or account settings
              },
            ),
          ],
          leading: ResponsiveWidget.isLargeScreen(context)
              ? null
              : Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
        ),
        SliverToBoxAdapter(
          child: Builder(
            builder: (context) {
              switch (selectedRoute) {
                case "home":
                  return _buildPopularItems();
                case "order_history":
                  return const OrderHistoryScreen();
                default:
                  return const Center(
                      child: Text('Select a Menu Item',
                          style: TextStyle(fontSize: 24)));
              }
            },
          ),
        ),
      ],
    );
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
              appBarTitle = routeName == "home"
                  ? "Home"
                  : "Order History"; // Update AppBar title
            });
          },
        ),
        Expanded(
          child: _buildMainContent(),
        ),
      ],
    );
  }

  Widget _buildDrawerScreen(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(
        onNavigate: (routeName) {
          Navigator.of(context).pop(); // Close the drawer
          setState(() {
            selectedRoute = routeName;
            appBarTitle = routeName == "home" ? "Home" : "Order History";
          });
        },
      ),
      body: _buildMainContent(), // This now includes the AppBar
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        children: [
          Sidebar(
            isPermanent: true,
            onNavigate: (routeName) {
              setState(() {
                selectedRoute = routeName;
                appBarTitle = routeName == "home" ? "Home" : "Order History";
              });
            },
          ),
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
      mediumScreen: _buildDrawerScreen(context),
      smallScreen: _buildDrawerScreen(context),
    );
  }
}
