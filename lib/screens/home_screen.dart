import 'package:flutter/material.dart';
import 'package:ginkhaoyang/widgets/side_menu.dart';
import 'package:ginkhaoyang/widgets/top_nav.dart';
import 'package:ginkhaoyang/helpers/reponsiveness.dart';
import 'package:ginkhaoyang/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const SideMenu(), // Display the side menu on smaller screens
      appBar: topNavigationBar(
          context, scaffoldKey), // Include the top navigation bar
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!ResponsiveWidget.isSmallScreen(context))
              const Expanded(
                flex: 1,
                child: SideMenu(), // Display the side menu on larger screens
              ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CustomText(
                    text: "Welcome to the Dashboard",
                    size: 24,
                    weight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  // Add more widgets to display content as needed
                  Expanded(
                    child: Center(
                      child: CustomText(
                        text: "This is the main content area",
                        size: 16,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
