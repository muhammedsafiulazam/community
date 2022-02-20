
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:json_annotation/json_annotation.dart';

import 'Info.dart';
import 'User.dart';

part 'Results.g.dart';

@JsonSerializable()
class Results {

  /// Users.
  @JsonKey(name: "results")
  final List<User>? users;

  /// Info.
  final Info? info;

  Results({this.users, this.info});

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}