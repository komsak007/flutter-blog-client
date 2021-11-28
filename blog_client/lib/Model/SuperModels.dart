// ignore_for_file: file_names, empty_constructor_bodies

import 'package:blog_client/Model/addBlogModels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SuperModels.g.dart';

@JsonSerializable()
class SuperModels {
  List<AddBlogModel> data;

  SuperModels({required this.data});

  factory SuperModels.fromJson(Map<String, dynamic> json) =>
      _$SuperModelsFromJson(json);
  Map<String, dynamic> toJson() => _$SuperModelsToJson(this);
}
