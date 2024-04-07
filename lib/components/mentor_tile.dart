import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorando/components/star_rating.dart';
import 'package:mentorando/models/mentor_model.dart';

class MentorTile extends StatefulWidget {
  final MentorModel mentorInfo;

  MentorTile({
    super.key,
    required this.mentorInfo
  });

  @override
  State<MentorTile> createState() => _MentorTileState();
}

class _MentorTileState extends State<MentorTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.mentorInfo.imgProfile,
            width: 50,
            height: 80,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.mentorInfo.name,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xff363B53),
                    ),
                  ),
                ),
            Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.mentorInfo.occupation,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff363B53),
                    ),
                  ),
                ),
            // Rating Stars Builder
            Align(
              alignment: Alignment.centerLeft,
              child: IgnorePointer(
                child: StarRating(initialRating: widget.mentorInfo.rating),
              ),
            ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                fixedSize: const Size(20, 20),
                backgroundColor: const Color(0xffEDEEF2),
                side: const BorderSide(style: BorderStyle.none)
            ),
            child: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 22,
                weight: 700,
                color: const Color(0xff363B53)
            ),
          ),
        ],
      ),
    );
  }
}
