import 'package:json_annotation/json_annotation.dart';

part 'json_two_dart_demo.g.dart';

@JsonSerializable(nullable: true, ignoreUnannotated: false)
class JsonTwoDartDemo {
  @JsonKey(name: 'userId')
  double userId;
  @JsonKey(name: 'id')
  double id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'body')
  String body;

  JsonTwoDartDemo({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory JsonTwoDartDemo.fromJson(Map<String, dynamic> json) =>
      _$JsonTwoDartDemoFromJson(json);

  Map<String, dynamic> toJson() => _$JsonTwoDartDemoToJson(this);
}
