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

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();

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
                      "Cadastro",
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
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
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
                                    labelText: "CPF",
                                    textInputType: TextInputType.number,
                                    inputFormatters: [cpfFormatter],
                                    validator: cpfValidator,
                                    controller: cpfController,
                                  ),
                                  FormClickableText(
                                      label: "já possui conta? ",
                                      clickableLabel: "faça seu login",
                                      nextPage: MaterialPageRoute(
                                          builder: (_) => LoginPage())),
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
                                              String cpf = cpfController.text;

                                              authController.signUp(email, pass, name, phone, cpf);
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
