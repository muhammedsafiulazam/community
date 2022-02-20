
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'IAddOn.dart';

/// AddOn manager interface.
abstract class IAddOnManager extends IAddOn {

  /// Initializes with [baseUrl].
  Future<void> initialize({String? baseUrl});
}