import 'package:flutter/material.dart';
import 'package:mentorando/components/custom_button.dart';
import 'package:mentorando/components/profile_bullet_section.dart';
import 'package:mentorando/components/profile_normal_section.dart';
import 'package:mentorando/components/user_profile_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text("Perfil"),
      ),
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(iconButton: Icons.settings, action: () => {})
                  ],),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 32),
              child: UserProfileSection(),
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
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
