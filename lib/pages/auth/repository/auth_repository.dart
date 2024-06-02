import 'package:mentorando/config/endpoints.dart';
import 'package:mentorando/models/user_model.dart';
import 'package:mentorando/pages/auth/repository/auth_errors.dart';
import 'package:mentorando/pages/auth/result/auth_result.dart';
import 'package:mentorando/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleAuthRequest(Map<dynamic, dynamic> result) {
      if (result['result'] != null) {
        final user = UserModel.fromJson(result['result']);
        return AuthResult.success(user);
      } else {
        return AuthResult.error(authErrorString(result['error']));
      }
  }

  Future<AuthResult> signIn({ required String email, required String password }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.signIn,
        method: HttpMethod.post,
        body: {
          "email": email,
          "password": password,
        },
    );
    return handleAuthRequest(result);
  }

  Future<AuthResult> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String occupation
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signUp,
      method: HttpMethod.post,
      body: {
        "email": email,
        "password": password,
        "fullname": name,
        "phone": phone,
        "occupation": occupation,
      },
    );

    return handleAuthRequest(result);
  }

  Future<AuthResult> updateUser({ required String aboutme, required List<String> stacks, required String userId }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.updateUserInfo,
        method: HttpMethod.post,
      body: {
        "stacks": stacks,
        "aboutme": aboutme,
        "userId": userId
      }
    );

    return handleAuthRequest(result);
  }
}