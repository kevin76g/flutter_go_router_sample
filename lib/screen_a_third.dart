import 'package:flutter/material.dart';

class ScreenAThird extends StatelessWidget {
  const ScreenAThird({
    required this.label,
    required this.fruit,
    required this.category,
    Key? key,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String label;
  final String fruit;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen$label'),
      ),
      body: Center(
        child: Text(
          'Details for $fruit & $category',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
