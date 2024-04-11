import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:mentorando/components/custom_button.dart';
import 'package:mentorando/components/mentor_profile_section.dart';
import 'package:mentorando/components/profile_bullet_section.dart';
import 'package:mentorando/components/profile_normal_section.dart';
import 'package:mentorando/models/mentor_model.dart';

class MentorDetails extends StatelessWidget {
  final MentorModel mentorInfo;

  const MentorDetails({
    super.key,
    required this.mentorInfo
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 18, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(iconButton: Icons.arrow_back_ios_rounded, action: () => Navigator.pop(context)),
                    CustomButton(iconButton: Icons.favorite, action: () => {})
                ],),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 32),
              child: MentorProfileSection(mentorInfo: mentorInfo),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  CustomButton(iconButton: Icons.mail, action: () {}),
                  const SizedBox(width: 15),
                  CustomButton(iconButton: Icons.message_rounded, action: () {}),
                ],
              ),
            ),
            Expanded(
              flex: 2,
                child: ListView(
                  children: const [
                   ProfileNormalSection(
                       sectionTitle: "Sobre Mim",
                       sectionMainContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis urna nisi. Sus pendisse porttitor bibendum erat, eu volutpat dui ali quam ne Vivamus nec ipsum porta, aliquet mi vitae, rhoncus magna. Morbi placerat, justo at feugiat dapibus, orci tellus eleifend urna, et interdum est lore",
                   ),
                    ProfileBulletSection(
                      sectionTitle: "Tecnologias",
                      stacks: ["JavaScript", "ReactJs", "AngularJS", "Redux/Context API"],
                    ),
                    ProfileNormalSection(
                      sectionTitle: "Como posso te ajudar",
                      sectionMainContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis urna nisi. Sus pendisse porttitor bibendum erat, eu volutpat dui ali quam ne Vivamus nec ipsum porta, aliquet mi vitae, rhoncus magna. Morbi placerat, justo at feugiat dapibus, orci tellus eleifend urna, et interdum est lore",
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
