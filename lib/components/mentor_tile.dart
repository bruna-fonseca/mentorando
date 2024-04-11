import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorando/components/star_rating.dart';
import 'package:mentorando/models/mentor_model.dart';
import 'package:mentorando/pages/mentor/mentor_details.dart';

class MentorTile extends StatefulWidget {
  final MentorModel mentorInfo;

  const MentorTile({
    super.key,
    required this.mentorInfo
  });

  @override
  State<MentorTile> createState() => _MentorTileState();
}

class _MentorTileState extends State<MentorTile> {
  bool isFavorite = false;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MentorDetails(mentorInfo: widget.mentorInfo),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(_createRoute());
          },
          child: Ink(
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
                // Favorite Button
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
          ),
        ),
      ),
    );
  }
}
