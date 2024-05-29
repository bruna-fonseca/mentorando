import 'package:get/get.dart';
import 'package:mentorando/pages/mentor/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}