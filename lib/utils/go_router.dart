// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/main.dart';
import 'package:pomodoro/screens/home/home.dart';
import 'package:pomodoro/screens/main_page.dart';
import 'package:pomodoro/screens/settings.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final GoRouter router = GoRouter(
   navigatorKey: _rootNavigatorKey,
   initialLocation: '/home',
  routes: <RouteBase>[
    // GoRoute(
    //   path: '/',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return MyHomePage(title: 'Flutter Demo Home Page');
    //   },
    // ),
    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) => const Home(),
    // ),
    // GoRoute(
    //   path: '/settings',
    //   builder: (context, state) => const Settings(),
    // ),
      StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return MainPage(
            navigationShell: navigationShell,);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Home(),
              ),
              // routes: [
              //   // child route
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) =>
              //         const DetailsScreen(label: 'A'),
              //   ),
              // ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Settings(),
              ),
              // routes: [
              //   // child route
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) =>
              //         const DetailsScreen(label: 'B'),
              //   ),
              // ],
            ),
          ],
        ),
      ],
    ),
  ],
);
