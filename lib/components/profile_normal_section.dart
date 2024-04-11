import 'package:flutter/material.dart';

class ProfileNormalSection extends StatelessWidget {
  final String sectionTitle;
  final String sectionMainContent;

  const ProfileNormalSection({
    super.key,
    required this.sectionTitle,
    required this.sectionMainContent
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              sectionTitle,
              style: const TextStyle(
                fontSize: 30,
                color: Color(0xff363B53),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                sectionMainContent,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff363B53),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
