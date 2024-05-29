import 'package:json_annotation/json_annotation.dart';

part 'mentor_model.g.dart';

@JsonSerializable()
class MentorModel {
  String? id;
  String? description;
  String? howCanHelp;
  String name;
  String occupation;
  double rating;
  @JsonKey(name: 'image')
  String imgProfile;
  List<String> stacks;

  MentorModel({
    this.id,
    this.description,
    this.howCanHelp,
    required this.name,
    required this.occupation,
    required this.rating,
    required this.imgProfile,
    required this.stacks
  });

  factory MentorModel.fromJson(Map<String, dynamic> json) => _$MentorModelFromJson(json);

  Map<String, dynamic> toJson() => _$MentorModelToJson(this);
}