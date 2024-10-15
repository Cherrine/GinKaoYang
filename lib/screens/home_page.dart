import 'package:flutter/material.dart';
import 'package:ginkhaoyang/widgets/collapsible_sidebar.dart';
import 'package:ginkhaoyang/widgets/responsive_widget.dart';

class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({Key? key}) : super(key: key);

  @override
  _ResponsiveHomePageState createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  bool _isCollapsed = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              title: const Text('Home'),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            )
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              child: CollapsibleSidebar(
                isCollapsed: false,
                onToggle: () {},
              ),
            )
          : null,
      body: ResponsiveWidget(
        largeScreen: _buildLargeScreen(context),
        mediumScreen: _buildMediumScreen(context),
        smallScreen: _buildSmallScreen(context),
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return Row(
      children: [
        CollapsibleSidebar(
          isCollapsed: _isCollapsed,
          onToggle: () => setState(() => _isCollapsed = !_isCollapsed),
        ),
        Expanded(child: _buildMainContent()),
      ],
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return Row(
      children: [
        CollapsibleSidebar(
          isCollapsed: true,
          onToggle: () {
            // For medium screen, we don't allow toggling
          },
        ),
        Expanded(child: _buildMainContent()),
      ],
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Center(
      child: Text('Main Content Area - ${MediaQuery.of(context).size.width.toStringAsFixed(2)}'),
    );
  }
}