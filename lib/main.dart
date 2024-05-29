import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorando/pages_routes/app_pages.dart';
import 'pages/auth/controller/auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: Paths.login,
      getPages: AppPages.pages,
    );
  }
}
