import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantapp/const/constants.dart';
import 'package:plantapp/screens/favority_screen.dart';
import 'package:plantapp/screens/profile_screen.dart';
import 'package:plantapp/screens/scan_screen.dart';
import 'package:plantapp/screens/home_screen.dart';

import 'cart_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int activeIndex = 0;

  List<Widget> pages = const [
    HomePage(),
    FavorityPage(),
    CartPage(),
    ProfilePage(),
  ];

  List<IconData> bottomIcons = const [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];

  List<String> appBarTitle = const [
    "خانه",
    "علاقه‌مندی‌ها",
    "سبدخرید",
    "پروفایل",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: Constants.iconsColor,
              ),
              Text(
                appBarTitle[activeIndex],
                style: TextStyle(color: Constants.iconsColor),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: activeIndex,
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Constants.themeColor,
          child: Image.asset(
            "./Assets/images/code-scan-two.png",
            height: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                  child: const ScanPage(),
                  type: PageTransitionType.bottomToTop),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: bottomIcons,
          activeIndex: activeIndex,
          activeColor: Constants.themeColor,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 5,
          rightCornerRadius: 5,
          onTap: (index) => setState(() => activeIndex = index),
        ));
  }
}
