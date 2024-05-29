import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mentorando/models/mentor_model.dart';

class MentorPreferences {
  static const _mentorsKey = 'mentors';
  static List<MentorModel> mentors = [];

  static Future<void> saveMentors(MentorModel mentor) async {
    mentors.add(mentor);
    final prefs = await SharedPreferences.getInstance();
    final String mentorsJson = json.encode(mentors.map((mentor) => mentor.toJson()).toList());
    await prefs.setString(_mentorsKey, mentorsJson);
  }

  static Future<List<MentorModel>> loadMentors() async {
    final prefs = await SharedPreferences.getInstance();
    final String? mentorsJson = prefs.getString(_mentorsKey);

    if (mentorsJson == null) {
      return [];
    }

    final List<dynamic> mentorsMap = json.decode(mentorsJson);
    return mentorsMap.map((map) => MentorModel.fromJson(map)).toList();
  }
}