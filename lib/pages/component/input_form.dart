import 'package:flutter/material.dart';

import '../../components/constants.dart';

class BmiInputTextForm extends StatelessWidget {
  const BmiInputTextForm({
    Key? key,
    required TextEditingController inputTextController,
    required this.inputType,
  })  : _inputTextController = inputTextController,
        super(key: key);

  final String inputType;
  final TextEditingController _inputTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$inputType 입력"),
        const SizedBox(height: smallSpace),
        TextFormField(
          controller: _inputTextController,
          maxLength: 3,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "$inputType 입력하시오.",
          ),
          validator: (value) {
            if (value != null) {
              if (value.trim().isEmpty) {
                return "$inputType를 입력하세요!";
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
