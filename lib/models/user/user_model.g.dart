// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    username: json['username'] as String?,
    nickname: json['nickname'] as String?,
    email: json['email'] as String?,
    role: json['role'] as int?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'nickname': instance.nickname,
      'email': instance.email,
      'role': instance.role,
    };
