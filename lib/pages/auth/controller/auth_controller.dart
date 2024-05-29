import 'package:get/get.dart';
import 'package:mentorando/models/user_model.dart';
import 'package:mentorando/pages/auth/repository/auth_repository.dart';
import 'package:mentorando/pages/auth/result/auth_result.dart';
import 'package:mentorando/pages_routes/app_pages.dart';
import 'package:mentorando/utils/utils_service.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> signUp(String email, String password, String name, String phone, String cpf) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        cpf: cpf);
    
    result.when(
        success: (user) {
          this.user = user;
          Get.offAllNamed(Paths.initial);
        },
        error: (message) {
          utilsServices.showToast(
            message: message,
            isError: true,
          );
        });

    isLoading.value = false;
  }

  Future<void> signIn({
    required String email,
    required String password
  }) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(email: email, password: password);
    isLoading.value = false;

    result.when(
        success: (user) {
          this.user = user;
          Get.offAllNamed(Paths.initial);
        },
        error: (message) {
          utilsServices.showToast(
              message: message,
            isError: true,
          );
        });
  }
}