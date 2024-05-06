import 'package:flutter/material.dart';
import 'package:mentorando/components/expandable_title_tile.dart';
import 'package:mentorando/pages/sprint/components/custom_check_list_tile.dart';
import 'package:mentorando/config/mentor_data.dart' as mentor_data;

class SprintCard extends StatelessWidget {
  const SprintCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: ExpandableTitleTile(mentorInfo: mentor_data.fourthMentor),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return CustomCheckListTile(taskLabel: mentor_data.roadMapList[index]);
                  },
                  separatorBuilder: (_, index) => const SizedBox(height: 5),
                  itemCount: mentor_data.roadMapList.length
              ),
            ),
          ],
        ),
      ),
    );
  }
}
