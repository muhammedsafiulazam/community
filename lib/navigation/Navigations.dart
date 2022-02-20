
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/navigation/NavigationKey.dart';
import 'package:mangue/mangue.dart';
import 'package:community/screen/algorithm/AlgorithmScreenWidget.dart';
import 'package:community/screen/home/HomeScreenWidget.dart';
import 'package:community/screen/profile/ProfileScreenWidget.dart';
import 'package:community/screen/users/UsersScreenWidget.dart';

/// Navigations.
class Navigations {

    /// Initialize.
    static Future<void> initialize() async {

        // Initialize routes.
        IScreenManager screenManager = AddOnManager().getAddOn<IScreenManager>() as IScreenManager;
        screenManager.setRouter((key, {index, data}) {
            ScreenWidget? widget;
            switch(key) {
                case NavigationKey.HOME_SCREEN:
                    widget = HomeScreenWidget(data: data);
                    break;
                case NavigationKey.USERS_SCREEN:
                    widget = UsersScreenWidget(data: data);
                    break;
                case NavigationKey.ALGORITHM_SCREEN:
                    widget = AlgorithmScreenWidget(data: data);
                    break;
                case NavigationKey.PROFILE_SCREEN:
                    widget = ProfileScreenWidget(data: data);
                    break;
            }
            return widget;
        });
    }
}