import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorando/components/stack_tile.dart';
import 'package:mentorando/components/star_rating.dart';
import 'package:mentorando/models/mentor_model.dart';

class UserProfileSection extends StatelessWidget {
  final List<String> stacks = [
    "javascript",
    "react",
    "nodeJS"
  ];

  UserProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/mentors/man1.svg",
          width: 150,
          height: 150,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Usuário",
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
                  "Dev Jr.",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withAlpha(100)
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index)  => StackTile(stackLabel: stacks[index]),
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
