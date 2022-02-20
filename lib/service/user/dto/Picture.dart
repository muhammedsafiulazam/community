

/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:json_annotation/json_annotation.dart';

part 'Picture.g.dart';

@JsonSerializable()
class Picture {

  /// Large.
  final String? large;

  /// Medium.
  final String? medium;

  /// Thumbnail.
  final String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}