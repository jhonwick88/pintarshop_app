part of 'user_model.dart';

@JsonSerializable()
class User {
  const User({this.id, this.username, this.nickname, this.email, this.role});
  final int? id;
  final String? username;
  final String? nickname;
  final String? email;
  final int? role;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
