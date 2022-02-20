
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:mangue/mangue.dart';

class Event {

  /// Key.
  String key;

  /// Data.
  dynamic data;

  /// Error.
  GenericError? error;

  Event(this.key, {this.data, this.error});
}