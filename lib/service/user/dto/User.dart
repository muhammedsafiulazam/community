
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:json_annotation/json_annotation.dart';

import 'Name.dart';
import 'Picture.dart';

part 'User.g.dart';

@JsonSerializable()
class User {

  /// Genders.
  static const String GENDER_MALE = "male";
  static const String GENDER_FEMALE = "female";

  /// Name.
  final Name? name;

  /// Picture.
  final Picture? picture;

  /// Nationality.
  @JsonKey(name: "nat")
  final String? nationality;

  /// Gender.
  final String? gender;

  User({this.gender, this.name, this.picture, this.nationality});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}