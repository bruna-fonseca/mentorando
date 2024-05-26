import 'package:flutter/material.dart';
import 'package:mentorando/pages/auth/sign_up_page.dart';
import 'package:mentorando/pages/initial_page.dart';
import '../../components/form_clickable_text.dart';
import '../../components/form_oulined_button.dart';
import '../../components/form_text_field.dart';
import '../home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ super.key });

  final _formKey = GlobalKey<FormState>();

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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                FormTextField(
                                    labelText: "e-mail",
                                    validator: (email) {
                                      if (email == null  || email.isEmpty) return "Digite seu email";
                                      if (!email.isValidEmail()) return "Digite um email valido!";
                                      return null;
                                    },
                                ),
                                FormTextField(
                                    labelText: "senha",
                                    isSecret: true,
                                  validator: (password) {
                                      if (password == null || password.isEmpty) return "Digite sua senha";
                                      if (password.length < 5) return "A senha deve possuir mais de 4 caracteres";
                                      return null;
                                  },
                                ),
                                FormClickableText(
                                  label: "não possui conta? ",
                                  clickableLabel: "faça seu cadastro",
                                  nextPage: MaterialPageRoute(builder: (_) => SignUpPage()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(builder: (_) => const InitialPage()
                                            ));
                                      }
                                    },
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(250, 60),
                                        side: const BorderSide(width: 2, color: Color(0xff363B53))
                                    ),
                                    child: const Text(
                                      "fazer login",
                                      style: TextStyle(
                                        color: Color(0xff363B53),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
