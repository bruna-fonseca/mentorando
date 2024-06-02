// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['fullname'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      aboutme: json['aboutme'] as String?,
      occupation: json['occupation'] as String?,
      stacks:
          (json['stacks'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.name,
      'email': instance.email,
      'token': instance.token,
      'aboutme': instance.aboutme,
      'occupation': instance.occupation,
      'stacks': instance.stacks,
    };
