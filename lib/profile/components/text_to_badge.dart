import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorando/pages/auth/controller/auth_controller.dart';

class TextToBadge extends StatefulWidget {
  @override
  _TextToBadgeState createState() => _TextToBadgeState();
}

class _TextToBadgeState extends State<TextToBadge> {
  TextEditingController _textController = TextEditingController();
  final AuthController _controller = Get.put(AuthController());
  List<String> _badges = [];

  void _handleTextInput(String text) {
    if (text.endsWith(' ')) {
      setState(() {
        String trimmedText = text.trim();
        if (trimmedText.isNotEmpty) {
          _controller.udpateBadges(trimmedText);
          _badges.add(trimmedText);
        }
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                children: [
                  ..._badges.map((badge) {
                    return Chip(
                      label: Text(badge),
                      onDeleted: () {
                        setState(() {
                          _badges.remove(badge);
                        });
                      },
                    );
                  }).toList(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: TextField(
                      controller: _textController,
                      onChanged: _handleTextInput,
                      decoration: const InputDecoration(
                          fillColor: Color(0xffEDEEF2),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(16))
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xAA363B53),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}