import 'package:json_annotation/json_annotation.dart';

part 'to_do_response_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ToDoResponseModel {
  @JsonKey(name: 'userId')
  int userId;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'completed')
  bool completed;

  ToDoResponseModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory ToDoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ToDoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoResponseModelToJson(this);
}
