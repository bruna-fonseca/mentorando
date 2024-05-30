import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorando/components/mentor_tile.dart';
import 'package:mentorando/pages/mentor/controller/home_controller.dart';
import '../../components/simple_text_field.dart';
import '../../components/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedStack;

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
      body: GetBuilder<HomeController>(
        builder: (homeController) {
          if (homeController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
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
                              homeController.filterMentors(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        SearchButton(selectStack: homeController.selectStack),
                      ],
                    ),
                  ),
                  homeController.selectedStack != null ? OutlinedButton(
                    onPressed: () {
                       homeController.clearFilter();
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
                        return MentorTile(mentorInfo: homeController.filteredAllMentors[index]);
                      },
                      separatorBuilder: (_, index) => const SizedBox(height: 20),
                      itemCount: homeController.filteredAllMentors.length,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}