
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/constants/Constants.dart' as cs;
import 'package:community/service/user/IUserService.dart';
import 'package:community/service/user/UserService.dart';
import 'package:mangue/mangue.dart';

/// AddOns.
class AddOns {

    /// Initialize.
    static Future<void> initialize() async {
        // Initialize addon manager.
        AddOnManager().initialize(baseUrl: cs.Constants.BASE_URL);

        // Add user service as addon.
        IServiceManager serviceManager = AddOnManager().getAddOn<IServiceManager>() as IServiceManager;
        serviceManager.addAddOn<IUserService>(UserService());
    }
}