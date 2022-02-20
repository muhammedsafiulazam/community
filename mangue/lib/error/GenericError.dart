
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

class GenericError extends Error {
  /// Code.
  int? code;

  /// Message.
  String? message;

  GenericError({this.code, this.message});
}