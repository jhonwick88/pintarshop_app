part of 'user_model.dart';

@JsonSerializable()
class User {
  User({this.id, this.username, this.nickname, this.email, this.role});
  late int? id;
  late String? username;
  late String? nickname;
  late String? email;
  late int? role;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
