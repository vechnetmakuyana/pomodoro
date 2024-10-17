import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/blocs/cubit/time_cubit.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/widgets/bottom_nav_bar/bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    var timeState = context.watch<TimeCubit>();

    return Scaffold(
      // extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pomodoro',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: kPrimaryColor,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/refresh.svg',
                  ),
                ],
              ),
            ),
            navigationShell,
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              if (timeState.state.pausedTime!) {
                context.read<TimeCubit>().stopTime();
              } else {
                context.read<TimeCubit>().startTime();
              }
            },
            child: timeState.state.pausedTime!
                ? const Icon(
                    Icons.stop,
                    color: Colors.white,
                  )
                : SvgPicture.asset(
                    'assets/images/play.svg',
                    width: 20,
                    height: 20,
                  ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: navigationShell.currentIndex,
        navigationShell: navigationShell,
      ),
    );
  }
}
