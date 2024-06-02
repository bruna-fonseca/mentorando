import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mentorando/models/exercise_item_model.dart';
import 'package:mentorando/pages/sprint/repository/sprint_repository.dart';
import 'package:mentorando/pages/sprint/result/roadmap_result.dart';
import 'package:mentorando/utils/utils_service.dart';

class ItemController extends GetxController {
  final sprintRepository = SprintRepository();
  final utilsService = UtilsServices();
  List<ExerciseItemModel> exercises = [];
  String roadmapId;

  ItemController(this.roadmapId);

  @override onInit() {
    super.onInit();

    getSprintItems();
  }


  Future<void> getSprintItems() async {
    final RoadmapResult<List<ExerciseItemModel>> result = await sprintRepository.getRoadmapItems(roadmapId: roadmapId);

    result.when(
        success: (exerciseItems) {
          exercises = exerciseItems;
          update();
        },
        error: (message) {
          utilsService.showToast(
              message: message,
              isError: true);
        }
    );
  }
}