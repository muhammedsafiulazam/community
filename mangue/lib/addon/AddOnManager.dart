
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:mangue/mangue.dart';

/// AddOn manager.
class AddOnManager extends AddOn implements IAddOnManager {

  // Constructor.
  AddOnManager._internal();

  // Singleton.
  static final IAddOnManager _instance = AddOnManager._internal();

  /// Factory.
  factory AddOnManager() {
    return _instance as AddOnManager;
  }

  @override
  Future<void> initialize({String? baseUrl}) async {
    // Screen manager.
    IScreenManager screenManager = ScreenManager();
    addAddOn<IScreenManager>(screenManager);

    // Event manager.
    IEventManager eventManager = EventManager();
    addAddOn<IEventManager>(eventManager);

    // Network manager.
    INetworkManager networkManager = NetworkManager(baseUrl: baseUrl);
    addAddOn<INetworkManager>(networkManager);

    // Service manager.
    IServiceManager serviceManager = ServiceManager();
    addAddOn<IServiceManager>(serviceManager);
  }
}