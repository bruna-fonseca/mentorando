import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  @JsonKey(name: 'fullname')
  final String? name;
  final String? email;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.token
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}