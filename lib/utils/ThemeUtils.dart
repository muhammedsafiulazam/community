/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:mangue/dimens/Dimens.dart';

class ThemeUtils {

  // Tag.
  static const String TAG = "[THEME_UTILS]";

  static ThemeData build(Brightness brightness) {
    // Primary color.
    Color primaryColor = const Color(0xFFDE570E);

    // Icon color.
    Color iconColor = const Color(0xFF000000);

    // Theme data.
    ThemeData themeData = ThemeData(brightness: brightness, fontFamily: Constants.FONT_FAMILY);

    // Customize theme data.
    themeData = themeData.copyWith(
        primaryColor: primaryColor,
        colorScheme: themeData.colorScheme.copyWith(primary: primaryColor),
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: TextStyle(color: primaryColor, fontSize: Dimens.font_size_medium, fontWeight: FontWeight.bold),
          toolbarTextStyle: TextStyle(color: primaryColor, fontSize: Dimens.font_size_medium, fontWeight: FontWeight.normal),
          elevation: 0.0,
          centerTitle: true,
        ),
        iconTheme: IconThemeData(
            color: iconColor
        ),
        primaryIconTheme: IconThemeData(
            color: iconColor
        ),
        buttonTheme: ButtonThemeData(
            colorScheme: themeData.buttonTheme.colorScheme?.copyWith(primary: primaryColor)
        ),
        textTheme: themeData.textTheme.copyWith(button: themeData.textTheme.button?.copyWith(color: Colors.white)),
        inputDecorationTheme: const InputDecorationTheme(
            contentPadding: Dimens.padding_small,
        )
    );

    // Return theme data.
    return themeData;
  }
}

