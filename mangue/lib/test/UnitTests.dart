
/*
 * Copyright (c) 2021 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Unit tests.
class UnitTests {

  // Durations.
  static const int WAIT_DURATION_MIN = 2;
  static const int WAIT_DURATION_MEDIUM = 3;
  static const int WAIT_DURATION_MAX = 5;

  /// Initialize unit tests.
  static Future<void> initialize() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    // Mock camera.
    const MethodChannel('plugins.flutter.io/camera').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'availableCameras') {
        return List.empty(growable: true);
      }
      return null;
    });

    // Mock permission.
    const MethodChannel('flutter.baseflow.com/permissions/methods').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'requestPermissions') {
        return Map();
      }
      return null;
    });

    // Mock firebase.
    const MethodChannel('plugins.flutter.io/firebase_messaging').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'configure') {
        return null;
      }
      return null;
    });
  }

  static Future<Null> wait(int seconds) async {
    return Future.delayed(Duration(seconds: seconds), (){});
  }

  static Future<Null> minWait() async {
    return wait(WAIT_DURATION_MIN);
  }

  static Future<Null> mediumWait() async {
    return wait(WAIT_DURATION_MEDIUM);
  }

  static Future<Null> maxWait() async {
    return wait(WAIT_DURATION_MAX);
  }
}