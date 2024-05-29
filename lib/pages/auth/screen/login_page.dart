import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorando/pages/auth/controller/auth_controller.dart';
import 'package:mentorando/pages/auth/screen/sign_up_page.dart';
import 'package:mentorando/services/validators.dart';
import '../../../components/form_clickable_text.dart';
import '../../../components/form_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ super.key });

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff363B53),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
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
                                        controller: emailController,
                                        textInputType: TextInputType.emailAddress,
                                        labelText: "e-mail",
                                        validator: emailvalidator,
                                    ),
                                    FormTextField(
                                        controller: passwordController,
                                        labelText: "senha",
                                        isSecret: true,
                                      validator: passwordValidator,
                                    ),
                                    FormClickableText(
                                      label: "não possui conta? ",
                                      clickableLabel: "faça seu cadastro",
                                      nextPage: MaterialPageRoute(builder: (_) => SignUpPage()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: GetX<AuthController>(
                                        builder: (authController) {
                                          return OutlinedButton(
                                            onPressed: () {
                                              FocusScope.of(context).unfocus();
                                              if (_formKey.currentState!.validate()) {
                                                String email = emailController.text;
                                                String pass = passwordController.text;
          
                                                authController.signIn(email: email, password: pass);
                                              } else {
                                                print('deu ruim na validação');
                                              }
                                            },
                                            style: OutlinedButton.styleFrom(
                                                fixedSize: const Size(250, 60),
                                                side: const BorderSide(width: 2, color: Color(0xff363B53))
                                            ),
                                            child: authController.isLoading.value ?
                                            const CircularProgressIndicator() :
                                            const Text(
                                              "fazer login",
                                              style: TextStyle(
                                                color: Color(0xff363B53),
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        },
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
