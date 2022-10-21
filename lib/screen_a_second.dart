import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenASecond extends StatelessWidget {
  const ScreenASecond({
    required this.label,
    required this.fruit,
    Key? key,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String fruit;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen$label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Details for $fruit',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/fruits/$fruit/categories/Kyohou');
              },
              child: const Text('View Kyohou details'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/fruits/$fruit/categories/Pione');
              },
              child: const Text('View Pione details'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/fruits/$fruit/categories/Deraware');
              },
              child: const Text('View Deraware details'),
            ),
          ],
        ),
      ),
    );
  }
}
