part of 'user_model.dart';

@JsonSerializable()
class User {
  User(
      {required this.id,
      required this.username,
      required this.nickname,
      required this.email,
      required this.role});
  int id;
  String username;
  String nickname;
  String email;
  int role;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
