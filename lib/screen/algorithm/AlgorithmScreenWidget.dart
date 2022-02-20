
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:mangue/mangue.dart';

import 'AlgorithmScreen.dart';

/// Algorithm screen widget.
class AlgorithmScreenWidget extends ScreenWidget {

  AlgorithmScreenWidget({Key? key, dynamic data}) : super(data: data);

  @override
  State<ScreenWidget> createState() {
    return AlgorithmScreen();
  }
}