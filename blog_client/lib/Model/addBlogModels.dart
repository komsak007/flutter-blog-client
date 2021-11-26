// ignore_for_file: file_names, empty_constructor_bodies

import 'package:json_annotation/json_annotation.dart';

part 'addBlogModels.g.dart';

@JsonSerializable()
class AddBlogModel {
  String coverImage;
  int count;
  int share;
  int comment;
  String id;
  String username;
  String title;
  String body;

  AddBlogModel({
    required this.coverImage,
    required this.count,
    required this.share,
    required this.comment,
    required this.id,
    required this.username,
    required this.title,
    required this.body,
  });

  factory AddBlogModel.fromJson(Map<String, dynamic> json) =>
      _$AddBlogModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddBlogModelToJson(this);
}
