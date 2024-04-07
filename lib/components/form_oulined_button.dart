import 'package:flutter/material.dart';

class FormOutlinedButton extends StatelessWidget {
  final Route nextPage;
  final String buttonText;

  const FormOutlinedButton({
    super.key,
    required this.nextPage,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OutlinedButton(
        onPressed: () {
            Navigator.of(context).pushReplacement(nextPage);
          },
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(250, 60),
            side: const BorderSide(width: 2, color: Color(0xff363B53))
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Color(0xff363B53),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
