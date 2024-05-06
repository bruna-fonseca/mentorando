import 'package:flutter/material.dart';

typedef MyEventCallback = void Function(String value);

class SimpleTextField extends StatelessWidget {
  final String labelText;
  final MyEventCallback callback;

  const SimpleTextField({
    super.key,
    required this.labelText,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        callback(value);
      },
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
