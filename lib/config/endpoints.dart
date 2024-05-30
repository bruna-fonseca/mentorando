const String baseURL = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static const String signIn = '$baseURL/login';
  static const String signUp = '$baseURL/sign-up';
  static const String getMentors = '$baseURL/get-mentors-list';
}