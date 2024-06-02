import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorando/components/expandable_title_tile.dart';
import 'package:mentorando/models/roadmap_model.dart';
import 'package:mentorando/pages/sprint/controllers/item_controller.dart';
import 'package:mentorando/pages/sprint/views/components/custom_check_list_tile.dart';

class SprintCard extends StatelessWidget {
  final RoadmapModel roadmap;

  const SprintCard({ super.key, required this.roadmap });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
        child: GetBuilder<ItemController>(
          init: ItemController(roadmap.id),
          global: false,
          builder: (controller) {
            return ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: ExpandableTitleTile(mentorInfo: roadmap.mentor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return CustomCheckListTile(taskLabel: controller.exercises[index].exercise);
                      },
                      separatorBuilder: (_, index) => const SizedBox(height: 5),
                      itemCount: controller.exercises.length,
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
