import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/dashboard/dashboard.dart';
import 'package:syntax_app/screens/home/home.dart';
import 'package:syntax_app/screens/nav/bottom_icons.dart';

/// A screen that handles navigation between different pages.
class NavigationScreen extends StatefulWidget {
  /// Creates a new instance of the NavigationScreen.
  const NavigationScreen({this.selectedPage = 0, super.key});

  /// Page selected
  final int selectedPage;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('selectedPage', selectedPage));
  }
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
    unawaited(_setSelectedPage());
  }

  Future<void>? _setSelectedPage() async {
    setState(() {
      selectedPage = widget.selectedPage;
    });
    return;
  }

  Widget _buildSelectedPage() {
    switch (selectedPage) {
      case 0:
        return const HomepageScreen();
      case 1:
        return const Dashboard();
      default:
        return const HomepageScreen();
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.2),
          body: _buildSelectedPage(),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomIcon(
                activeImage: Icons.home_outlined,
                index: 0,
                name: "Home",
                callback: () {
                  setState(() {
                    selectedPage = 0;
                  });
                },
                selectedPage: selectedPage,
                image: Icons.home,
              ),
              BottomIcon(
                activeImage: Icons.dashboard_outlined,
                index: 1,
                name: "Dashboard",
                callback: () {
                  setState(() {
                    selectedPage = 1;
                  });
                },
                selectedPage: selectedPage,
                image: Icons.dashboard,
              ),
            ],
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('selectedPage', selectedPage));
  }
}
