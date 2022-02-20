
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'dart:convert';
import 'package:mangue/mangue.dart';
import 'IUserService.dart';
import 'dto/Results.dart';
import 'event/UserServiceKey.dart';

/// User service.
class UserService extends AddOn implements IUserService {

  // Managers.
  late final IEventManager _mEventManager = AddOnManager().getAddOn<IEventManager>() as IEventManager;
  late final INetworkManager _mNetworkManager = AddOnManager().getAddOn<INetworkManager>() as INetworkManager;

  UserService() : super() {
    // Nothing.
  }

  @override
  Future<void> getUsers(int page, int count, {EventCallback? callback}) async {
    _mNetworkManager.request(NetworkManager.METHOD_GET, "/api/?page=$page&results=$count", null, null, (response) {
      if (response.statusCode == NetworkManager.STATUS_CODE_OK) {
        Results results = Results.fromJson(jsonDecode(response.body));
        Event event = Event(UserServiceKey.GET_USERS, data: results, error: null);

        callback?.call(event);
        _mEventManager.fire(event);
      } else {

        Error error = GenericError(message: I18n.error);
        Event event = Event(UserServiceKey.GET_USERS, data: null, error: error as GenericError?);

        callback?.call(event);
        _mEventManager.fire(event);
      }
    });
  }
}