
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:mangue/mangue.dart';


/// Screen.
class Screen<T extends ScreenWidget> extends State<T> with WidgetsBindingObserver, SingleTickerProviderStateMixin {

  // Show loader.
  bool _isLoading = false;

  // Unique key.
  final UniqueKey _mUniqueKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    onCreate();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      onStart();
    }
    else if (state == AppLifecycleState.paused) {
      onStop();

    }
  }

  /// Returns true if loading.
  bool isLoading() {
    return _isLoading;
  }

  /// Show loader.
  void showLoader(bool show) {
    notifyUpdates(() {
      _isLoading = show;
    });
  }

  /// Notify updates.
  void notifyUpdates(VoidCallback? callback) {
    if (mounted) {
      setState(() {
        callback?.call();
      });
    } else {
      callback?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _mUniqueKey,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context),
        bottomNavigationBar: buildNavigationBar(context),
        resizeToAvoidBottomInset: true,
      ),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 0) {
          onPause();
        } else if (info.visibleFraction == 1) {
          onResume();
        }
      }
    );
  }

  /// @nodoc
  /// Builds body.
  @override
  Widget buildBody(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () {
              // Problem: Numeric keyboard (iOS) doesn't show "action" button.
              // Solution: Keyboard hides on click outside of boundaries.
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: List<Widget>.from([
                  Flexible(
                      child: Stack(
                          children: List<Widget>.from([
                            buildContent(context) ?? Container(),
                            isLoading() ? LoaderUtils.createActivity(context) : null
                          ].where((element) => element != null))
                      )
                  ),
                ].where((element) => element != null))
            )
        )
    );
  }

  /// Builds app bar.
  AppBar? buildAppBar(BuildContext context) {
    return null;
  }

  /// Builds content.
  Widget? buildContent(BuildContext context) {
    return null;
  }

  /// Builds navigation bar.
  NavigationBar? buildNavigationBar(BuildContext context) {
    return null;
  }

  void onCreate() {
  }

  /// On app starts.
  void onStart() {
    // Nothing.
  }

  /// On resume.
  void onResume() {
    // Nothing.
  }

  /// On pause.
  void onPause() {
    // Nothing.
  }

  /// On app stops.
  void onStop() {
    // Nothing.
  }

  // On dispose.
  void onDispose() {
    // Nothing.
  }

  @override
  void dispose() {
    onDispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}