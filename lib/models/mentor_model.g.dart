// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorModel _$MentorModelFromJson(Map<String, dynamic> json) => MentorModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      howCanHelp: json['howCanHelp'] as String?,
      name: json['name'] as String,
      occupation: json['occupation'] as String,
      rating: (json['rating'] as num).toDouble(),
      imgProfile: json['image'] as String,
      stacks:
          (json['stacks'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MentorModelToJson(MentorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'howCanHelp': instance.howCanHelp,
      'name': instance.name,
      'occupation': instance.occupation,
      'rating': instance.rating,
      'image': instance.imgProfile,
      'stacks': instance.stacks,
    };
