import 'package:bottom_navigation_bar_tutorial/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomAppbar extends StatelessWidget {
  final Color selectedColor;
  final Color unSelectedColor;
  final Function(int index) onTap;
  final List<CustomBottomAppBarItem> children;
  final int selectedTab;
  const CustomBottomAppbar({
    Key? key,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.onTap,
    required this.children,
    required this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: klightBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.grey.shade300,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            children.length,
            (index) {
              return CustomBottomAppBarItem(
                icon: children[index].icon,
                text: children[index].text,
                color: selectedTab == index ? selectedColor : unSelectedColor,
                press: () {
                  onTap(index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomBottomAppBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? press;
  final Color? color;
  const CustomBottomAppBarItem({
    Key? key,
    required this.icon,
    required this.text,
    this.press,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kprimaryColor,
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: color == kprimaryColor ? kprimaryColor : Colors.grey.shade300,
        ),
      ),
    );
  }
}
