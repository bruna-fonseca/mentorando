import 'package:get/get.dart';
import 'package:mentorando/models/mentor_model.dart';
import 'package:mentorando/pages/mentor/repository/home_repository.dart';
import 'package:mentorando/pages/mentor/result/home_result.dart';
import 'package:mentorando/utils/utils_service.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isLoading = false;
  List<MentorModel> allMentors = [];
  List<MentorModel> filteredAllMentors = [];
  int? selectedStack;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  void setMentors(List<MentorModel> mentors) {
    allMentors = mentors;
    filteredAllMentors = allMentors;
    update();
  }

  @override
  onInit() {
    super.onInit();
    getAllMentor();
  }

  Future<void> getAllMentor() async {
    setLoading(true);

    HomeResult<MentorModel> homeResult = await homeRepository.getAllMentors();

    setLoading(false);

    homeResult.when(success: (mentors) {
      setMentors(mentors);
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }

  void filterMentors(String value) {
    if (value.isEmpty) {
      filteredAllMentors = allMentors;
    } else {
      filteredAllMentors = allMentors
          .where((mentor) =>
              mentor.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    update();
  }

  selectStack(newStack, List<String> stacks) {
    selectedStack = newStack;
    filteredAllMentors = allMentors
        .where((mentor) => mentor.stacks.any((stack) => stack
            .toLowerCase()
            .contains(stacks[newStack].toLowerCase())))
        .toList();
    update();
  }

  clearFilter() {
    filteredAllMentors = allMentors;
    selectedStack = null;
    update();
  }
}
