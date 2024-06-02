import 'package:json_annotation/json_annotation.dart';

part 'exercise_item_model.g.dart';

@JsonSerializable()
class ExerciseItemModel {
  String exercise;

  ExerciseItemModel({
    required this.exercise,
  });

  factory ExerciseItemModel.fromJson(Map<String, dynamic> json) => _$ExerciseItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseItemModelToJson(this);

}