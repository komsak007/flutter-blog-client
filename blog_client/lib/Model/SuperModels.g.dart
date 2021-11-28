// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SuperModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperModels _$SuperModelsFromJson(Map<String, dynamic> json) => SuperModels(
      data: (json['data'] as List<dynamic>)
          .map((e) => AddBlogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuperModelsToJson(SuperModels instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
