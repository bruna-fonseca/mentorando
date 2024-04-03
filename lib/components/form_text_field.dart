import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String labelText;

  const FormTextField({
    super.key,
    required this.labelText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
            fillColor: const Color(0xffEDEEF2),
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            labelText: labelText.toString(),
            labelStyle: const TextStyle(
              color: Color(0xAA363B53),
            )
        ),
      ),
    );
  }
}
