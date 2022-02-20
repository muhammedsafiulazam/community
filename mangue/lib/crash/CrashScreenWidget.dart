
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:mangue/mangue.dart';

import 'CrashScreen.dart';

/// Crash screen widget.
class CrashScreenWidget extends ScreenWidget {

  /// Error.
  Object? error;

  /// Stack.
  StackTrace? stack;

  // Opens with error and stack.
  CrashScreenWidget(this.error, this.stack, {Key? key, dynamic data}) : super(key: key, data: data);

  @override
  State<ScreenWidget> createState() {
    return CrashScreen();
  }
}