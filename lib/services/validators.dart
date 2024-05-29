import 'package:get/get.dart';
import 'package:mentorando/pages/auth/screen/login_page.dart';

String? emailvalidator(String? email) {
  if (email == null || email.isEmpty)
    return "Digite seu email";
  if (!email.isValidEmail())
    return "Digite um email valido!";
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) return "Digite sua senha";
  if (password.length < 5) return "A senha deve possuir mais de 4 caracteres";
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) return "Digite seu nome";
  if (name.split(' ').length == 1) return "Digite seu nome completo";

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) return "Digite seu celular";
  if (!phone.isPhoneNumber) return "Digite um número válido";
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) return "Digite seu CPF";
  if (!cpf.isCpf) return "Digite um CPF válido!";
  return null;
}