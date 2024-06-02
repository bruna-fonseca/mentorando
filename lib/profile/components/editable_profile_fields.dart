import 'package:flutter/material.dart';
import 'package:mentorando/profile/components/custom_textfield.dart';
import 'package:mentorando/profile/components/text_to_badge.dart';

class EditableProfileFields extends StatelessWidget {
  EditableProfileFields({ super.key, required this.aboutmeController });

  final TextEditingController aboutmeController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: ListView(
          children: [
            CustomTextFieldProfile(
              sectionTitle: 'Sobre Mim',
              controller: aboutmeController,
              ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tecnologias",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff363B53),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            TextToBadge(),
          ],
        )
    );
  }
}
