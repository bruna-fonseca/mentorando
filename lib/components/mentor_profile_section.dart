import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorando/components/stack_tile.dart';
import 'package:mentorando/components/star_rating.dart';
import 'package:mentorando/models/mentor_model.dart';

class MentorProfileSection extends StatelessWidget {
  final MentorModel mentorInfo;

  MentorProfileSection({
    super.key,
    required this.mentorInfo
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.network(
          mentorInfo.imgProfile,
          width: 150,
          height: 150,
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
                    fontSize: 28,
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
              Align(
                alignment: Alignment.centerLeft,
                child: IgnorePointer(
                  child: StarRating(initialRating: mentorInfo.rating),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index)  => StackTile(stackLabel: mentorInfo.stacks[index]),
                  separatorBuilder: (_, index) => const SizedBox(width: 8),
                  itemCount: 3,
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
