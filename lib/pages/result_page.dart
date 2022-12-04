import 'package:flutter/material.dart';

import '../components/constants.dart';
import 'component/build_icon.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.height, required this.weight});

  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    final double bmi = weight / ((height / 100) * (height / 100));

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calcBmi(bmi),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: smallSpace),
            buildIcon(bmi: bmi),
          ],
        ),
      ),
    );
  }

  String _calcBmi(double bmi) {
    String result = "저채중";
    if (bmi >= 35) {
      result = '고도비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }
}
