import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorando/models/sprint_mentor_model.dart';

class ExpandableTitleTile extends StatelessWidget {
  final SprintMentorModel mentorInfo;

  const ExpandableTitleTile({
    super.key,
    required this.mentorInfo
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.network(
          mentorInfo.image,
          width: 100,
          height: 100,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  mentorInfo.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff363B53),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  mentorInfo.occupation,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withAlpha(100)
                  ),
                ),
              ),
            ],
          ),
        ),
        // Text(mentorInfo.name)
      ],
    );
  }
}
