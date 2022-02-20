
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';


/// Screen manager.
class ScreenManager extends AddOn implements IScreenManager {

  // Properties.
  final GlobalKey<NavigatorState> _mRootKey = GlobalKey();

  // Properties.
  ScreenRouter? _mScreenRouter;

  ScreenManager() : super();

  GlobalKey<NavigatorState> getRootKey() {
    return _mRootKey;
  }

  @override
  BuildContext? getRootContext() {
    return _mRootKey.currentContext;
  }

  @override
  void setRouter(ScreenRouter navigation) {
    _mScreenRouter = navigation;
  }

  void open(ScreenWidget widget, {ScreenPolicy? policy = ScreenPolicy.Push}) {
    // Context.
    BuildContext? context = getRootContext();

    if (context != null) {

      Route route = MaterialPageRoute(builder: (context) => widget);

      if (policy == ScreenPolicy.Clear) {
        // Clear.
        Navigator.of(context).pushAndRemoveUntil(route, ModalRoute.withName("/"));
      } else if (policy == ScreenPolicy.Root) {
        // Root.
        Navigator.of(context).pushAndRemoveUntil(route, ModalRoute.withName(""));
      } else {
        // Push.
        Navigator.of(context).push(route);
      }
    }
  }

  @override
  void load(String key, {ScreenPolicy? policy, dynamic data}) {
      // Context.
      BuildContext? context = getRootContext();

      if (context != null) {

        if (key == ScreenKey.ROOT_SCREEN) {

          // Force ( Go back to root ).
          Navigator.of(context).popUntil((route) => route.isFirst);

        } else {

          if (_mScreenRouter == null) {
            if (kDebugMode) {
              print("Please define a router.");
            }
            return;
          }

          // Screen.
          ScreenWidget widget = _mScreenRouter!(key, data: data)!;
          open(widget, policy: policy);
        }
      }
  }
}