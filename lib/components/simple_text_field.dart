import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  final String labelText;

  const SimpleTextField({
    super.key,
    required this.labelText
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search, color: Color(0xff363B53)),
          fillColor: const Color(0xffEDEEF2),
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xAA363B53),
          )
      ),
    );
  }
}
