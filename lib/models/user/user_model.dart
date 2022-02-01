import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

part 'user.dart';

@JsonSerializable()
class UserModel {
  final User? user;
  final String? token;

  const UserModel({this.user, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static const empty = UserModel(
      user: User(id: 0, username: "", nickname: "", email: "", role: 0),
      token: "");
}
