import 'package:flutter/material.dart';

class CustomTextFieldProfile extends StatelessWidget {
  final String sectionTitle;
  final TextEditingController controller;

  const CustomTextFieldProfile({
    super.key,
    required this.sectionTitle,
    required this.controller,
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
              child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      fillColor: Color(0xffEDEEF2),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xAA363B53),
                      )
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
