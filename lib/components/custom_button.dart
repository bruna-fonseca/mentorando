import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData iconButton;
  final VoidCallback action;

  const CustomButton({
    super.key,
    required this.iconButton,
    required this.action
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          fixedSize: const Size(20, 60),
          backgroundColor: const Color(0xffEDEEF2),
          side: const BorderSide(style: BorderStyle.none)
      ),
      onPressed: action,
      child: Icon(
        iconButton,
        size: 30,
        color: const Color(0xff363B53),
      ),
    );
  }
}
