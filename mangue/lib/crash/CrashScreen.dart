
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

/// Crash screen.
class CrashScreen extends Screen<CrashScreenWidget> {

  @override
  void onCreate() {
    super.onCreate();
  }

  @override
  AppBar? buildAppBar(BuildContext context) {
    return AppBar(title: Text(I18n.crash));
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
        padding: Dimens.margin_medium,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                            hasScrollBody: false,
                            child: _buildCrashMessage(context)
                        )
                      ]
                  )
              ),
              _buildRestartButton(context)
            ]
        )
    );
  }

  Widget _buildCrashMessage(BuildContext context) {

    String message = I18n.restart_application_message;
    Widget wdtChild = Center(
        child: Text(message, textAlign: TextAlign.center)
    );

    // Crash report.
    if (kDebugMode) {

      String error = I18n.na;
      if (widget.error != null) {
        error = widget.error.toString();
      }

      String stack = I18n.na;
      if (widget.stack != null) {
        stack = widget.stack.toString();
      }

      String message = I18n.error_crash_error_stack.replaceAll("{error}", error).replaceAll("{stack}", stack);
      wdtChild = Text(message, textAlign: TextAlign.left);
    }

    return Container(
        margin: EdgeInsets.only(bottom: Dimens.margin_medium.bottom),
        child: wdtChild
    );
  }

  Widget _buildRestartButton(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Dimens.margin_medium.top),
        child: Center(child: OutlinedButton(child: Text(I18n.restart),
          onPressed: () {
            _onPressRestart();
          })
        )
    );
  }

  void _onPressRestart() async {
    // Restart.
    AppUtils.restart();
  }
}