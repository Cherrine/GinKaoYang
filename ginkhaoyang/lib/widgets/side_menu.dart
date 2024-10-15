import 'package:flutter/material.dart';
import 'package:ginkhaoyang/constants/controllers.dart';
import 'package:ginkhaoyang/constants/style.dart';
import 'package:ginkhaoyang/helpers/reponsiveness.dart';
import 'package:ginkhaoyang/routing/routes.dart';
import 'package:ginkhaoyang/widgets/custom_text.dart';
import 'package:ginkhaoyang/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    const Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map((item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (item.route == authenticationPageRoute) {
                        // Check if the route is the login page
                        Get.offAllNamed(
                            authenticationPageRoute); // Navigate to the login screen
                        menuController.changeActiveItemTo(
                            homePageDisplayName); // Optional: Reset the active menu item to Home
                      } else {
                        if (!menuController.isActive(item.name)) {
                          menuController.changeActiveItemTo(item.name);
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back(); // Close the drawer on small screens
                          }
                          navigationController.navigateTo(
                              item.route); // Navigate to the desired route
                        }
                      }
                    }))
                .toList(),
          ),
        ],
      ),
    );
  }
}
