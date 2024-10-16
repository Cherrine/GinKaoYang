import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;
  final double? customScreenBreakpoint;

  const ResponsiveWidget({
    super.key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
    this.customScreenBreakpoint,
  });

  // Screen size conditions
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isCustomScreen(BuildContext context, double breakpoint) {
    return MediaQuery.of(context).size.width >= breakpoint;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (customScreen != null && customScreenBreakpoint != null &&
            constraints.maxWidth >= customScreenBreakpoint!) {
          return customScreen!;
        } else if (constraints.maxWidth >= 1200) {
          return largeScreen;
        } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 1200) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}