import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorando/components/mentor_tile.dart';
import 'package:mentorando/config/endpoints.dart';
import 'package:mentorando/models/mentor_model.dart';
import 'package:mentorando/pages/mentor/controller/home_controller.dart';
import 'package:mentorando/services/http_manager.dart';
import '../../components/simple_text_field.dart';
import '../../components/search_button.dart';
import 'package:mentorando/config/mentor_data.dart' as mentor_data;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpManager httpManager = HttpManager();
  List<MentorModel> _filteredMentors = [];
  List<MentorModel> _originalMentorsList = [];
  int? selectedStack;
  bool _isLoading = true;
  bool _hasFetchedData = false;

  selectStack(newStack) {
    setState(() {
      selectedStack = newStack;
      _filteredMentors = _originalMentorsList
          .where((mentor) =>
          mentor.stacks.any((stack) =>
              stack.toLowerCase().contains(mentor_data.stacks[newStack].toLowerCase()))
      ).toList();
    });
  }

  @override
  void initState() {
    super.initState();
      Get.find<HomeController>().printExample();
      _fetchMentors();
  }

  Future<void> _fetchMentors() async {
    if (_hasFetchedData) return;

    try {
      final response = await httpManager.restRequest(
          url: Endpoints.getMentors,
          method: HttpMethod.post
      );
      final List<dynamic> data = response['result'];
      setState(() {
        _originalMentorsList = data.map((json) => MentorModel.fromJson(json)).toList();
        _filteredMentors = data.map((json) => MentorModel.fromJson(json)).toList();
        _isLoading = false;
        _hasFetchedData = true;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterMentors(String value) {
    setState(() {
      _filteredMentors = _originalMentorsList
          .where((mentor) =>
             mentor.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Nossos mentores',
          style: TextStyle(color: Color(0xff363B53)),
        ),
    ),
      body: _isLoading ? const Center(child: CircularProgressIndicator()) :
      Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SimpleTextField(
                        labelText: "procure mentores",
                        callback: (String value) {
                          _filterMentors(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    SearchButton(selectStack: selectStack),
                  ],
                ),
              ),
              selectedStack != null ? OutlinedButton(
                onPressed: () {
                  setState(() {
                    _filteredMentors = _originalMentorsList;
                    selectedStack = null;
                  });
                },
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(100, 20),
                    side: const BorderSide(width: 2, color: Color(0xff363B53))
                ),
                child: const Text(
                  "Limpar filtro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff363B53),
                    fontSize: 12,
                  ),
                ),
              ) : const SizedBox.shrink(),
              // Listagem de mentores
              Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return MentorTile(mentorInfo: _filteredMentors[index]);
                    },
                    separatorBuilder: (_, index) => const SizedBox(height: 20),
                    itemCount: _filteredMentors.length,
                ),
              ),
            ],
          ),
      ),
    );
  }
}