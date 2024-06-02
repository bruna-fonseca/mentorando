import 'package:get/get.dart';
import 'package:mentorando/pages/sprint/controllers/sprints_controller.dart';

class RoadmapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SprintsController());
  }
}