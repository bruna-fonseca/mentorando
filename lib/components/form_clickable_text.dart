import 'package:flutter/material.dart';

import '../pages/sign_up_page.dart';

class FormClickableText extends StatelessWidget {
  final String label;
  final String clickableLabel;

  const FormClickableText({
    super.key,
    required this.label,
    required this.clickableLabel
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 22),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            const Text("não possui conta? "),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text(
                  "faça seu cadastro",
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
          ])
      ),
    );
  }
}
