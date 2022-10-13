import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

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
                child: const Text('桃', style: MyApp.textStyle),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => context.go('/page2/ぶどう'),
                child: const Text('ぶどう', style: MyApp.textStyle),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => context.go('/page2/バナナ'),
                child: const Text('バナナ', style: MyApp.textStyle),
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
              Text(
                '$fruitを選びましたね',
                style: MyApp.textStyle,
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text(
                  'Go back to home page',
                  style: MyApp.textStyle,
                ),
              ),
            ],
          ),
        ),
      );
}
