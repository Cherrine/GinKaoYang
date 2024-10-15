import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class MainResponsive extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;

  const MainResponsive({
    super.key, 
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= largeScreenSize) {
          return largeScreen;
        } else if (constraints.maxWidth >= mediumScreenSize) {
          return mediumScreen ?? largeScreen;
        } else if (constraints.maxWidth >= smallScreenSize) {
          return smallScreen ?? mediumScreen ?? largeScreen;
        } else {
          return customScreen ?? smallScreen ?? mediumScreen ?? largeScreen;
        }
      },
    );
  }
}