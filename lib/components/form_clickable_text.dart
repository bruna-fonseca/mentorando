import 'package:flutter/material.dart';

class FormClickableText extends StatelessWidget {
  final String label;
  final String clickableLabel;
  final Route nextPage;

  const FormClickableText({
    super.key,
    required this.label,
    required this.clickableLabel,
    required this.nextPage
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 22),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            Text(label),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  nextPage,
                );
              },
              child: Text(
                  clickableLabel,
                  style: const TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
          ])
      ),
    );
  }
}
