
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:mangue/mangue.dart';

/// User service interface.
abstract class IUserService extends IAddOn {

  /// Get users.
  Future<void> getUsers(int page, int count, {EventCallback? callback});
}