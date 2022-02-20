
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/addons/AddOns.dart';
import 'package:community/service/user/IUserService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mangue/mangue.dart';

void main() async {

  // Initialize tests.
  await UnitTests.initialize();

  setUp(() async {
    // Initialize addons.
    await AddOns.initialize();
  });

  tearDown((){
    // Nothing.
  });

  test('getUsers', () async {

    IServiceManager? serviceManager = AddOnManager().getAddOn<IServiceManager>() as IServiceManager?;
    expect(serviceManager != null, true);

    IUserService? userService = serviceManager?.getAddOn<IUserService>() as IUserService?;
    expect(userService != null, true);

    // We can use MockClient.
    // But it's better to use real client here.
    // Need to find a solution.
  });
}