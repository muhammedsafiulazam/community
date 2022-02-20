
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

/// Loader utils.
class LoaderUtils {

  // Constants.
  static const Color _ACTIVITY_COLOR = Color.fromRGBO(0, 0, 0, 0);

  /// Creates activity widget with overlay.
  static Widget createActivity(BuildContext context, {Color? overlay}) {
    return AbsorbPointer(
      child: Container(
        color: overlay ?? _ACTIVITY_COLOR,
        child: const Center(
            child: CircularProgressIndicator()
        )
      )
    );
  }

  /// Creates message widget.
  static Widget createMessage(BuildContext context, String message, {Widget? button}) {
    ThemeData themeData = Theme.of(context);

    List<Widget> widgets = List.empty(growable: true);
    widgets.add(Text(message, textAlign: TextAlign.center, style: themeData.textTheme.subtitle1));

    if (button != null) {
      widgets.add(Container(
        margin: EdgeInsets.only(top: Dimens.margin_small.top),
        child: button,
      ));
    }

    return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets
      )
    );
  }
}