
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:mangue/mangue.dart';

/// Event manager.
class EventManager extends AddOn implements IEventManager {

  // Properties.
  final List<EventCallback> _mCallbacks = List.empty(growable: true);

  @override
  void fire(Event event) async {
    _mCallbacks.forEach((callback) {
      callback(event);
    });
  }

  @override
  EventCallback subscribe(EventCallback callback) {
    if (!_mCallbacks.contains(callback)) {
      _mCallbacks.add(callback);
    }
    return callback;
  }

  @override
  void unsubscribe(EventCallback callback) {
    if (_mCallbacks.contains(callback)) {
      _mCallbacks.remove(callback);
    }
  }
}