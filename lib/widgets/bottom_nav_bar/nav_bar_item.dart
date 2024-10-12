import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/utils/colors.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.asset,
    required this.index,
    required this.selected,
    required this.outline,
    required this.navigationShell,
  });

  final String asset;
  final int index;
  final bool selected;
  final String outline;
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _goBranch(index);
          },
          child: SvgPicture.asset(
            selected ? asset : outline,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: selected ? kPrimaryColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}
