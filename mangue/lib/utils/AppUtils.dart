/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mangue/mangue.dart';

class AppUtils {

  // Tag.
  static const String TAG = "[APP_UTILS]";

  static Future<void> run(ScreenWidget home, {List<LocalizationsDelegate<dynamic>>? localizations, ThemeData? theme}) async {

    // Localizations delegates.
    List<LocalizationsDelegate<dynamic>> lczs = [
      I18nDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ];
    if (localizations != null) {
      lczs.addAll(localizations);
    }

    // Root key.
    IScreenManager screenManager = AddOnManager().getAddOn<IScreenManager>() as IScreenManager;
    GlobalKey<NavigatorState> rootKey = screenManager.getRootKey();

    MaterialApp materialApp = MaterialApp(
      locale: Constants.LOCALES.first,
      localizationsDelegates: lczs,
      supportedLocales: Constants.LOCALES,
      navigatorKey: rootKey,
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: home,
    );

    runZonedGuarded(() async {
      runApp(materialApp);
    }, (Object error, StackTrace stack) {
      CrashUtils.handle(error, stack);
    });
  }

  @override
  static void restart() {
    exit(0);
  }
}

