import 'package:mentorando/config/endpoints.dart';
import 'package:mentorando/models/mentor_model.dart';
import 'package:mentorando/pages/mentor/result/home_result.dart';
import 'package:mentorando/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<MentorModel>> getAllMentors() async {
   final result = await _httpManager.restRequest(
       url: Endpoints.getMentors,
       method: HttpMethod.post
   );

   if (result['result'] != null) {
     // mentores
     List<MentorModel> data = (List<Map<String, dynamic>>.from(result['result']))
         .map(MentorModel.fromJson)
         .toList();

      return HomeResult<MentorModel>.success(data);
   } else {
     // error
     return HomeResult.error("Ocorreu um erro ao tentar recuperar os mentores");
   }
  }
}