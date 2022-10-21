import 'package:flutter/material.dart';
import 'package:flutter_go_router_sample/scaffold_with_navbar.dart';
import 'package:flutter_go_router_sample/screen_a.dart';
import 'package:flutter_go_router_sample/screen_a_second.dart';
import 'package:flutter_go_router_sample/screen_a_third.dart';
import 'package:flutter_go_router_sample/screen_b.dart';
import 'package:flutter_go_router_sample/screen_c.dart';
import 'package:go_router/go_router.dart';
import 'detail_screen.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title = 'GoRouter Example';
  static const textStyle = TextStyle(fontSize: 26.0);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: _router,
        title: title,
      );

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
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
            path: '/a',
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenA();
            },
            routes: <RouteBase>[
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                  path: 'fruits/:fruit',
                  builder: (BuildContext context, GoRouterState state) {
                    final fruit = state.params['fruit'];
                    return ScreenASecond(
                      label: 'A',
                      fruit: fruit!,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'categories/:category',
                      builder: (BuildContext context, GoRouterState state) {
                        final fruit = state.params['fruit'];
                        final category = state.params['category'];
                        return ScreenAThird(
                          label: 'A',
                          fruit: fruit!,
                          category: category!,
                        );
                      },
                    ),
                  ]),
            ],
          ),

          /// Displayed when the second item in the the bottom navigation bar is
          /// selected.
          GoRoute(
            path: '/b',
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenB();
            },
            routes: <RouteBase>[
              /// Same as "/a/details", but displayed on the root Navigator by
              /// specifying [parentNavigatorKey]. This will cover both screen B
              /// and the application shell.
              GoRoute(
                path: 'details',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'B');
                },
              ),
            ],
          ),

          /// The third screen to display in the bottom navigation bar.
          GoRoute(
            path: '/c',
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenC();
            },
            routes: <RouteBase>[
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'C');
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
