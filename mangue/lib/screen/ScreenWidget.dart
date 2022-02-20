
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screen.dart';


/// Screen widget.
class ScreenWidget extends StatefulWidget {

  dynamic data;

  ScreenWidget({Key? key, this.data}) : super(key: key);

  /// Gets name.
  String getName() {
    // Specially for analytics.
    return "@${runtimeType.toString()}";
  }

  @override
  State<StatefulWidget> createState() {
    return Screen();
  }
}