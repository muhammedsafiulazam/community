
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'CardWidget.dart';

/// Card state.
class CardState extends State<CardWidget> {

  @override
  Widget build(BuildContext context) {
      // Theme.
      ThemeData themeData = Theme.of(context);

      return CornerWidget(
          child: Container(
              width: widget.width,
              height: widget.height,
              padding: widget.padding,
              margin: widget.margin,
              child: widget.child,
              color: themeData.cardColor,
          ),
          radius: widget.corner
      );
  }
}