// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoResponseModel _$ToDoResponseModelFromJson(Map<String, dynamic> json) =>
    ToDoResponseModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$ToDoResponseModelToJson(ToDoResponseModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
