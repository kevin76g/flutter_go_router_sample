import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // usePathUrlStrategy();
  runApp(MyApp());
}

const List<Map> fruits = [
  {'id': 'grape', 'title': 'ぶどう', 'price': '1500'},
  {'id': 'banana', 'title': 'バナナ', 'price': '200'},
];

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
                final num = state.extra as int;
                return Page2Screen(
                  id: id!,
                  num: num,
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
                onPressed: () => context.go('/page2/grape', extra: 1500),
                child: const Text('ぶどうを1500円で購入', style: MyApp.textStyle),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () => context.go('/page2/banana', extra: 200),
                child: const Text('バナナを 200円で購入 ', style: MyApp.textStyle),
              ),
            ],
          ),
        ),
      );
}

class Page2Screen extends StatelessWidget {
  final String id;
  final int? num;
  const Page2Screen({required this.id, this.num, Key? key}) : super(key: key);

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
              '$title は${num.toString()}円です！',
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
