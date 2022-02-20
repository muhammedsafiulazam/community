
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

/// Validator interface.
abstract class Validator<T> {

  /// Returns true if valid.
  bool validate(T value);
}