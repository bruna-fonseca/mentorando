import 'package:get/get.dart';
import 'package:mentorando/pages/auth/screen/login_page.dart';
import 'package:mentorando/pages/auth/screen/sign_up_page.dart';
import 'package:mentorando/pages/mentor/binding/home_binding.dart';
import 'package:mentorando/pages/mentor/home_page.dart';
import 'package:mentorando/pages/initial_page.dart';
import 'package:mentorando/profile/profile_page.dart';
import 'package:mentorando/pages/sprint/binding/roadmaps_binding.dart';
import 'package:mentorando/profile/components/text_to_badge.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: Paths.login,
        page: () => LoginPage(),
    ),
    GetPage(
      name: Paths.signUp,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Paths.mentors,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Paths.initial,
      page: () => const InitialPage(),
      bindings: [
        HomeBindings(),
        RoadmapsBinding(),
      ],
    ),
    GetPage(
      name: Paths.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: Paths.test,
      page: () => TextToBadge(),
    ),
  ];
}

abstract class Paths {
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String mentors = '/mentors';
  static const String initial = '/';
  static const String profile = '/profile';
  static const String test = '/test';
}