import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/utils/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.navigationShell,
  });
  final int selectedIndex;
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

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
          navItem(
            asset: 'assets/images/home.svg',
            outline: 'assets/images/home_outline.svg',

            index: 0,
            selected: navigationShell.currentIndex==0,
          ),
          navItem(
            asset: 'assets/images/setting.svg',
            outline: 'assets/images/setting_outline.svg',

            index: 1,
            selected: navigationShell.currentIndex==1,
          ),
          const SizedBox()
        ],
      ),
    );
  }

  Widget navItem(
      {required String asset, required int index, required bool selected, required String outline}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _goBranch(index);
          },
          child: SvgPicture.asset(
           selected? asset:outline,
          ),
        ),
    
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Container(
              height: 10,
              width: 10,
              decoration:  BoxDecoration(
                color:selected? kPrimaryColor:Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          )
      ],
    );
  }
}
