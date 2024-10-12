import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/widgets/bottom_nav_bar/nav_bar_item.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.navigationShell,
  });
  final int selectedIndex;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      shape: const CircularNotchedRectangle(),
      notchMargin: 20,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NavBarItem(
            asset: 'assets/images/home.svg',
            outline: 'assets/images/home_outline.svg',
            index: 0,
            selected: navigationShell.currentIndex == 0,
            navigationShell: navigationShell,
          ),
          NavBarItem(
            asset: 'assets/images/setting.svg',
            outline: 'assets/images/setting_outline.svg',
            index: 1,
            selected: navigationShell.currentIndex == 1,
            navigationShell: navigationShell,
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
