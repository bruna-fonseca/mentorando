import 'package:json_annotation/json_annotation.dart';
import 'package:mentorando/models/sprint_mentor_model.dart';

part 'roadmap_model.g.dart';

@JsonSerializable()
class RoadmapModel {
  String id;
  SprintMentorModel mentor;

  RoadmapModel({
    required this.id,
    required this.mentor,
});

  factory RoadmapModel.fromJson(Map<String, dynamic> json) => _$RoadmapModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoadmapModelToJson(this);

  @override
  String toString() {
    return "($id, $mentor)";
  }
}