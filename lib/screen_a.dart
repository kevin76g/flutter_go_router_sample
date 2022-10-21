import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The first screen in the bottom navigation bar.
class ScreenA extends StatelessWidget {
  /// Constructs a [ScreenA] widget.
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Screen A',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/fruits/Grape');
              },
              child: const Text('View Grape details'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/fruits/Banana');
              },
              child: const Text('View Banana details'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/fruits/Strawberry');
              },
              child: const Text('View Strawberry details'),
            ),
          ],
        ),
      ),
    );
  }
}
