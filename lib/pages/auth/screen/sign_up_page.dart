import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mentorando/pages/auth/controller/auth_controller.dart';
import 'package:mentorando/pages/auth/screen/login_page.dart';
import 'package:mentorando/services/validators.dart';
import '../../../components/form_clickable_text.dart';
import 'package:get/get.dart';
import '../../../components/form_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({ super.key });

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff363B53),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: Text(
                      "mentorando.",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      "Cadastro",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FormTextField(
                              textInputType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: emailvalidator,
                              labelText: "e-mail"),
                          FormTextField(
                            validator: passwordValidator,
                            labelText: "senha",
                            controller: passwordController,
                            isSecret: true,
                          ),
                          FormTextField(
                            labelText: "nome completo",
                            validator: nameValidator,
                            controller: nameController,
                          ),
                          FormTextField(
                            labelText: "telefone",
                            textInputType: TextInputType.number,
                            inputFormatters: [phoneFormatter],
                            controller: phoneController,
                            validator: phoneValidator,
                          ),
                          FormTextField(
                            labelText: "Cargo",
                            textInputType: TextInputType.text,
                            validator: occupationValidator,
                            controller: occupationController,
                          ),
                          FormClickableText(
                            label: "já possui conta? ",
                            clickableLabel: "faça seu login",
                            nextPage: MaterialPageRoute(builder: (_) => LoginPage()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GetX<AuthController>(
                              builder: (authController) {
                                return OutlinedButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      String email = emailController.text;
                                      String pass = passwordController.text;
                                      String name = nameController.text;
                                      String phone = phoneController.text;
                                      String occupation = occupationController.text;

                                      authController.signUp(email, pass, name, phone, occupation);
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      fixedSize: const Size(250, 60),
                                      side: const BorderSide(width: 2, color: Color(0xff363B53))
                                  ),
                                  child: authController.isLoading.value ?
                                  const CircularProgressIndicator() :
                                  const Text(
                                    "cadastrar",
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
