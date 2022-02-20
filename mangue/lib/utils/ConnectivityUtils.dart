
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:connectivity/connectivity.dart';

/// Connectivity utils.
class ConnectivityUtils {

  /// Returns true if online.
  static Future<bool> isOnline() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}