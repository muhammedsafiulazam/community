
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */


import 'Validator.dart';

/// Number validator.
class NumberValidator extends Validator<String> {

  // Properties.
  final RegExp _mRegExp = RegExp(r'^[0-9]*$');

  @override
  bool validate(String? value) {
    if (value?.isNotEmpty ?? false) {
      return _mRegExp.hasMatch(value!);
    }
    return false;
  }
}