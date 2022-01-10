import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  int code;
  dynamic data;
  String message;

  BaseModel({required this.code, required this.data, required this.message});

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
