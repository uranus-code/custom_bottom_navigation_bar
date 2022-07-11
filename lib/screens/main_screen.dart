import 'package:bottom_navigation_bar_tutorial/constants.dart';
import 'package:bottom_navigation_bar_tutorial/screens/cart_screen.dart';
import 'package:bottom_navigation_bar_tutorial/screens/category_screen.dart';
import 'package:bottom_navigation_bar_tutorial/screens/home_screen.dart';
import 'package:bottom_navigation_bar_tutorial/screens/settings_screen.dart';
import 'package:bottom_navigation_bar_tutorial/widgets/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppbar(
        unSelectedColor: Colors.grey.shade400,
        selectedColor: kprimaryColor,
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
        selectedTab: _currentTab,
        children: const [
          CustomBottomAppBarItem(
            icon: Iconsax.home,
            text: "Home",
          ),
          CustomBottomAppBarItem(
            icon: Iconsax.grid_1,
            text: "Category",
          ),
          CustomBottomAppBarItem(
            icon: Iconsax.shopping_bag,
            text: "Cart",
          ),
          CustomBottomAppBarItem(
            icon: Iconsax.setting,
            text: "Settings",
          ),
        ],
      ),
      body: SafeArea(child: screens[_currentTab]),
    );
  }
}
