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
              path: 'page2/:id',
              builder: (BuildContext context, GoRouterState state) {
                final id = state.params['id'];
                return Page2Screen(
                  id: id!,
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
              const Text(
                'Page1',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () => context.go('/page2/grape'),
                child: const Text('id:100 ぶどう', style: MyApp.textStyle),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () => context.go('/page2/banana'),
                child: const Text('id:200 バナナ', style: MyApp.textStyle),
              ),
            ],
          ),
        ),
      );
}

class Page2Screen extends StatelessWidget {
  final String id;
  const Page2Screen({required this.id, Key? key}) : super(key: key);

  static const List<Map> fruits = [
    {
      'id': 'grape',
      'title': 'ぶどう',
    },
    {
      'id': 'banana',
      'title': 'バナナ',
    },
  ];

  String getFruitTitle(String id) {
    for (var fruit in fruits) {
      if (fruit['id'] == id) {
        return fruit['title'];
      }
    }
    return 'none';
  }

  @override
  Widget build(BuildContext context) {
    final title = getFruitTitle(id);

    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Page2',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              '$titleです！',
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
