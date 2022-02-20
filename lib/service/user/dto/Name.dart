


/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:json_annotation/json_annotation.dart';

part 'Name.g.dart';

@JsonSerializable()
class Name {

  /// Title.
  final String? title;

  /// First.
  final String? first;

  /// Last.
  final String? last;

  Name({this.title, this.first, this.last});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}