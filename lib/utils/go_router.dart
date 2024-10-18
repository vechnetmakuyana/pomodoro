// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    
      StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return MainPage(
            navigationShell: navigationShell,);
      },
      branches: [
      
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Home(),
              ),
             
            
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
              
            ),
          ],
        ),
      ],
    ),
  ],
);
