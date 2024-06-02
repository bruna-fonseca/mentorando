import 'package:json_annotation/json_annotation.dart';

part 'sprint_mentor_model.g.dart';

@JsonSerializable()
class SprintMentorModel {
  String name;
  String occupation;
  String image;

  SprintMentorModel({
    required this.name,
    required this.occupation,
    required this.image,
  });

  factory SprintMentorModel.fromJson(Map<String, dynamic> json) => _$SprintMentorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SprintMentorModelToJson(this);
}