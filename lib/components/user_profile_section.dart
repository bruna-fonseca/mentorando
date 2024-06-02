import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileSection extends StatelessWidget {
  final String name;
  final String occupation;

  const UserProfileSection({
    super.key, required this.name, required this.occupation,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
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
                  occupation,
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
