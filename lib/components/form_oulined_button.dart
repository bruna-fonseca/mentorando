import 'package:flutter/material.dart';

class FormOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;

  const FormOutlinedButton({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(250, 60),
            side: const BorderSide(width: 2, color: Color(0xff363B53))
        ),
        child: const Text(
          "fazer login",
          style: TextStyle(
            color: Color(0xff363B53),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
