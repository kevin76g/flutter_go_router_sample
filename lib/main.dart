import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title = 'GoRouter Example: Declarative Routes';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: _router,
        title: title,
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Page1Screen(),
        routes: <GoRoute>[
          GoRoute(
              path: 'page2/:fruit',
              builder: (BuildContext context, GoRouterState state) {
                final fruit = state.params['fruit'];
                return Page2Screen(
                  fruit: fruit!,
                );
              }),
        ],
      ),
    ],
  );
}

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(MyApp.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.go('/page2/桃'),
                child: const Text('Go to page 2'),
              ),
            ],
          ),
        ),
      );
}

class Page2Screen extends StatelessWidget {
  final String fruit;
  const Page2Screen({required this.fruit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(MyApp.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(fruit),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go back to home page'),
              ),
            ],
          ),
        ),
      );
}
