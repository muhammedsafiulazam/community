
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

/// Crash utils.
class CrashUtils {

  /// Properties.
  static bool _isHandling = false;

  /// Handles error with stack.
  static void handle(Object error, StackTrace stack) {
    if (_isHandling) {
      return;
    }

    IScreenManager screenManager = AddOnManager().getAddOn<IScreenManager>() as IScreenManager;
    BuildContext? context = screenManager.getRootContext();

    if (context != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => CrashScreenWidget(error, stack)),
              (Route<dynamic> route) => false
      );
    }
    
    _isHandling = false;
  }
}