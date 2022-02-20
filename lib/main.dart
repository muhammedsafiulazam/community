
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/addons/AddOns.dart';
import 'package:community/screen/home/HomeScreenWidget.dart';
import 'package:community/utils/ThemeUtils.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'localization/i18n_ext.dart';
import 'navigation/Navigations.dart';

void main() async {

  // Ensure initialization.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize addons.
  await AddOns.initialize();

  // Initialize navigations.
  await Navigations.initialize();

  /// Launch application.
  AppUtils.run(HomeScreenWidget(), localizations: [const I18nExtDelegate()], theme: ThemeUtils.build(Brightness.light));
}
