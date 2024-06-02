// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadmap_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadmapModel _$RoadmapModelFromJson(Map<String, dynamic> json) => RoadmapModel(
      id: json['id'] as String,
      mentor:
          SprintMentorModel.fromJson(json['mentor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoadmapModelToJson(RoadmapModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mentor': instance.mentor,
    };
