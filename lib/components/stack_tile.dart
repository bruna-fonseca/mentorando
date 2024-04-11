import 'package:flutter/material.dart';

class StackTile extends StatelessWidget {
  final String stackLabel;

  const StackTile({
    super.key,
    required this.stackLabel
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffD9D9D9)
        ),
        child: Text(
          stackLabel,
          style: const TextStyle(
            color: Color(0xff363B53),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
