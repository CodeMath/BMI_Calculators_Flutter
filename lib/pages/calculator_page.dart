import 'package:flutter/material.dart';

import '../components/constants.dart';
import 'component/input_form.dart';
import 'result_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _heightTextController = TextEditingController();
  final _weightTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _heightTextController.dispose();
    _weightTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI 계산기"),
      ),
      body: Padding(
          padding: pagePadding,
          child: BmiForm(
              formKey: _formKey,
              heightText: _heightTextController,
              weightText: _weightTextController)),
    );
  }
}

class BmiForm extends StatelessWidget {
  const BmiForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController heightText,
    required TextEditingController weightText,
  })  : _formKey = formKey,
        _heightTextController = heightText,
        _weightTextController = weightText,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _heightTextController;
  final TextEditingController _weightTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BmiInputTextForm(
            inputType: "키",
            inputTextController: _heightTextController,
          ),
          const SizedBox(height: smallSpace),
          BmiInputTextForm(
            inputType: "몸무게",
            inputTextController: _weightTextController,
          ),
          const SizedBox(height: smallSpace),
          Container(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        height: double.parse(_heightTextController.text.trim()),
                        weight: double.parse(_weightTextController.text.trim()),
                      ),
                    ),
                  );
                }
              },
              child: const Text("다음"),
            ),
          )
        ],
      ),
    );
  }
}
