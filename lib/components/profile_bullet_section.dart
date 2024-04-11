import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileBulletSection extends StatelessWidget {
  final String sectionTitle;
  final List<String> stacks;

  const ProfileBulletSection({
    super.key,
    required this.sectionTitle,
    required this.stacks
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              sectionTitle,
              style: const TextStyle(
                fontSize: 30,
                color: Color(0xff363B53),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\u2022 ${stacks[index]}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff363B53),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, index) => const SizedBox(height: 2),
              itemCount: stacks.length,
          ),
        ],
      ),
    );
  }
}
