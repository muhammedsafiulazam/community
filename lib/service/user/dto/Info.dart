

/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:json_annotation/json_annotation.dart';

part "Info.g.dart";

@JsonSerializable()
class Info {

  /// Seed.
  final String? seed;

  /// Results.
  final int? results;

  /// Page.
  final int? page;

  /// Version.
  final String? version;

  Info({this.seed, this.results, this.page, this.version});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}