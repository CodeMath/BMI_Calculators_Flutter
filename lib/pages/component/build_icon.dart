import 'package:flutter/material.dart';

// ignore: camel_case_types
class buildIcon extends StatelessWidget {
  const buildIcon({
    Key? key,
    required this.bmi,
  }) : super(key: key);

  final double bmi;

  @override
  Widget build(BuildContext context) {
    if (bmi >= 23) {
      return const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      return const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    } else {
      return const Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size: 100,
      );
    }
  }
}
