import 'package:get/get.dart';
import 'package:mentorando/models/roadmap_model.dart';
import 'package:mentorando/pages/auth/controller/auth_controller.dart';
import 'package:mentorando/pages/sprint/repository/sprint_repository.dart';
import 'package:mentorando/pages/sprint/result/roadmap_result.dart';
import 'package:mentorando/utils/utils_service.dart';

class SprintsController extends GetxController {
  List<RoadmapModel> allRoadmaps = [];
  final sprintRepository = SprintRepository();
  final authController = Get.find<AuthController>();
  final utilsServices = UtilsServices();

  @override onInit() {
    super.onInit();

    getAllRoadmaps();
  }

  Future<void> getAllRoadmaps() async {
    RoadmapResult<List<RoadmapModel>> result = await sprintRepository.
    getAllRoadmaps(userId: authController.user.id!);

    result.when(
        success: (roadmaps) {
          allRoadmaps = roadmaps;
          update();
        },
        error: (message) {
          utilsServices.showToast(
              message: message,
              isError: true );
        });
  }
}