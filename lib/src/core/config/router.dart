import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../features/home/presentation/pages/home.dart';
import '../widgets/scaffold_with_navbar.dart';
import '../../features/cart/presentation/pages/cart.dart';
import '../../features/settings/presentation/pages/settings.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        /// The first screen to display in the bottom navigation bar.
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage(
              title: 'Battery High',
              key: state.pageKey,
            );
          },
          routes: <RouteBase>[
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
          ],
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: '/cart',
          builder: (BuildContext context, GoRouterState state) {
            return CartPage();
          },
          routes: <RouteBase>[
            /// Same as "/a/details", but displayed on the root Navigator by
            /// specifying [parentNavigatorKey]. This will cover both screen B
            /// and the application shell.
          ],
        ),

        /// The third screen to display in the bottom navigation bar.
        GoRoute(
          path: '/settings',
          builder: (BuildContext context, GoRouterState state) {
            return SettingsPage();
          },
          routes: <RouteBase>[
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
          ],
        ),
      ],
    ),
  ],
);
