import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mentorando/pages/sprint/controllers/sprints_controller.dart';
import 'package:mentorando/pages/sprint/views/components/custom_progress_bar.dart';
import 'package:mentorando/pages/sprint/views/components/sprint_card.dart';

class SprintPage extends ConsumerStatefulWidget  {
  const SprintPage({ super.key });

  @override
  _SprintPageState createState() => _SprintPageState();
}

class _SprintPageState extends ConsumerState<SprintPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text("Progresso da sua Sprint"),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SprintsController>(
          builder: (controller) {
            return controller.allRoadmaps.isEmpty ? const Center(
              child: Padding(
                padding: EdgeInsets.all(100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ainda não há informações sobre sprints.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ) : Column(
              children: [
                const CustomProgressBar(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return SprintCard(roadmap: controller.allRoadmaps[index]);
                    },
                    separatorBuilder: (_, index) => const SizedBox(height: 20),
                    itemCount: controller.allRoadmaps.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
