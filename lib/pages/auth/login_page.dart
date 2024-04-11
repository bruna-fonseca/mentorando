import 'package:flutter/material.dart';
import 'package:mentorando/pages/auth/sign_up_page.dart';
import 'package:mentorando/pages/initial_page.dart';
import '../../components/form_clickable_text.dart';
import '../../components/form_oulined_button.dart';
import '../../components/form_text_field.dart';
import '../home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff363B53),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Center(
          child: Column(
              children: [
                const Spacer(),
                const Text(
                  "mentorando.",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const FormTextField(labelText: "e-mail"),
                              const FormTextField(labelText: "senha", isSecret: true),
                              FormClickableText(
                                label: "não possui conta? ",
                                clickableLabel: "faça seu cadastro",
                                nextPage: MaterialPageRoute(builder: (_) => const SignUpPage()),
                              ),
                              FormOutlinedButton(
                                  nextPage: MaterialPageRoute(builder: (_) => const InitialPage()),
                                  buttonText: "fazer login",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
        ),
      ),
    );
  }
}