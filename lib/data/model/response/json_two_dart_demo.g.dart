// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_two_dart_demo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonTwoDartDemo _$JsonTwoDartDemoFromJson(Map<String, dynamic> json) =>
    JsonTwoDartDemo(
      userId: (json['userId'] as num).toDouble(),
      id: (json['id'] as num).toDouble(),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$JsonTwoDartDemoToJson(JsonTwoDartDemo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
