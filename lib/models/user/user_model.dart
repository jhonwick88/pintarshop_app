import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

part 'user.dart';

@JsonSerializable()
class UserModel {
  User user;
  String token;

  UserModel({required this.user, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
