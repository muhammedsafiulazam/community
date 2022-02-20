
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'HomeScreen.dart';

/// Home screen widget.
class HomeScreenWidget extends ScreenWidget {

  HomeScreenWidget({Key? key, dynamic data}) : super(key: key, data: data);

  @override
  State<ScreenWidget> createState() {
    return HomeScreen();
  }
}