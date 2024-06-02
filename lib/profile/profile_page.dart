import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorando/components/custom_button.dart';
import 'package:mentorando/components/profile_bullet_section.dart';
import 'package:mentorando/components/profile_normal_section.dart';
import 'package:mentorando/components/user_profile_section.dart';
import 'package:mentorando/pages/auth/controller/auth_controller.dart';
import 'package:mentorando/profile/components/editable_profile_fields.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ super.key });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditingMode = false;

  TextEditingController aboutMeController = TextEditingController(text: "Esta é a seção sobre mim.");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text("Perfil"),
        ),
        body: GetBuilder<AuthController>(
          builder: (controller) {
            return Center(
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(iconButton: isEditingMode ? Icons.save : Icons.edit, action: () => {
                            setState(() {
                              isEditingMode = !isEditingMode;
                            }),

                            if (!isEditingMode) {
                              controller.updateUser(aboutme: aboutMeController.text)
                            }
                          })
                        ],),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 10, 32, 32),
                    child: UserProfileSection(
                        name: controller.user.name ?? '',
                        occupation: controller.user.occupation ?? ''
                    ),
                  ),
                  isEditingMode ? EditableProfileFields(aboutmeController: aboutMeController) : Expanded(
                      flex: 2,
                      child: ListView(
                        children: [
                          ProfileNormalSection(
                            sectionTitle: "Sobre Mim",
                            sectionMainContent: controller.user.aboutme ?? "Preencha com sua informação aqui",
                          ),
                          ProfileBulletSection(
                            sectionTitle: "Tecnologias",
                            stacks: controller.user.stacks ?? ["você pode adicionar as tecnologia que possui interesse"],
                          ),
                        ],
                      )
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
