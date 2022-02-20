
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:mangue/mangue.dart';

/// Event manager interface.
abstract class IEventManager extends IAddOn {

  /// Fires event.
  void fire(Event event);

  /// Subscribe to event.
  EventCallback subscribe(EventCallback callback);

  /// Unsubscribe from event.
  void unsubscribe(EventCallback callback);
}