
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/dimens/Dimens.dart';

import 'ButtonState.dart';

/// Button widget.
class ButtonWidget extends StatefulWidget {

  /// Lead.
  Icon? lead;

  /// Label.
  String? label;

  /// Trail.
  Icon? trail;

  /// Corner.
  BorderRadius corner;

  /// Width.
  double? width;

  /// Height.
  double height;

  /// Padding.
  EdgeInsets padding;

  /// Margin.
  EdgeInsets margin;

  /// On press callback.
  VoidCallback? onPress;

  ButtonWidget({Key? key, this.lead, required this.label, this.trail, this.corner = Dimens.border_radius_small, this.width, this.height = Dimens.button_height, this.padding = Dimens.padding_small, this.margin = Dimens.margin_zero, this.onPress}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}