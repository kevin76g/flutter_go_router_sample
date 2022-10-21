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
            const Text('Screen A'),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/details/Grape');
              },
              child: const Text('View Grape details'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/details/Banana');
              },
              child: const Text('View Banana details'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/details/Strawberry');
              },
              child: const Text('View Strawberry details'),
            ),
          ],
        ),
      ),
    );
  }
}
