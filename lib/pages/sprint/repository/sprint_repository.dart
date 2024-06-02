import 'package:mentorando/config/endpoints.dart';
import 'package:mentorando/models/exercise_item_model.dart';
import 'package:mentorando/models/roadmap_model.dart';
import 'package:mentorando/pages/sprint/result/roadmap_result.dart';
import 'package:mentorando/services/http_manager.dart';
import 'package:mentorando/utils/utils_service.dart';

class SprintRepository {
  final httpManager = HttpManager();
  final utilsServices = UtilsServices();

  Future<RoadmapResult<List<RoadmapModel>>> getAllRoadmaps({ required String userId }) async {
    final result = await httpManager.restRequest(
        url: Endpoints.getRoadmaps,
        method: HttpMethod.post,
        body: {
          'userId': userId
    }
    );

    if (result['result'] != null) {
      List<RoadmapModel> roadmaps = List<Map<String, dynamic>>
          .from(result['result'])
          .map(RoadmapModel.fromJson).toList();
      
      return RoadmapResult<List<RoadmapModel>>.success(roadmaps);
    } else {
      return RoadmapResult.error("Não foi possível recuperar as sprints");
    }
  }

  Future<RoadmapResult<List<ExerciseItemModel>>> getRoadmapItems({ required String roadmapId }) async {
    final result = await httpManager.restRequest(
        url: Endpoints.getRoadmapsItem,
        method: HttpMethod.post,
        body: {
          // "roadmapId": "d9FQ1Wre21"
          'roadmapId': roadmapId
        }
    );

    if (result['result'] != null) {
      List<ExerciseItemModel> items = List<Map<String, dynamic>>.from(result['result'])
          .map(ExerciseItemModel.fromJson)
          .toList();

      return RoadmapResult<List<ExerciseItemModel>>.success(items);
    } else {
      return RoadmapResult.error("não foi possível recuperar dados dos itens do roadmap");
    }
  }
}