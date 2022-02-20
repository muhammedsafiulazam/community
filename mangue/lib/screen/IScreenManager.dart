
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:mangue/mangue.dart';

/// Screen manager interface.
abstract class IScreenManager extends IAddOn {

  /// Gets root key.
  /// Uses:
  /// MaterialApp (
  ///   navigatorKey: TODO
  /// );
  GlobalKey<NavigatorState> getRootKey();

  /// Gets root context.
  BuildContext? getRootContext();

  /// Defines screen navigation.
  void setRouter(ScreenRouter navigation);

  /// Opens screen according to policy.
  void open(ScreenWidget widget, {ScreenPolicy? policy});

  /// Loads screen for key with policy.
  void load(String key, {ScreenPolicy? policy, dynamic data});
}