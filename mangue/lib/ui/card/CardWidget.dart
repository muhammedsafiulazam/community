
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'CardState.dart';

/// Card widget.
class CardWidget extends StatefulWidget {

  /// Child.
  Widget child;

  /// Corner.
  BorderRadius corner;

  /// Width.
  double? width;

  /// Height.
  double? height;

  /// Padding.
  EdgeInsets padding;

  /// Margin.
  EdgeInsets margin;

  /// On press callback.
  VoidCallback? onPress;

  CardWidget({Key? key, required this.child, this.corner = Dimens.border_radius_small, this.width, this.height, this.padding = Dimens.padding_small, this.margin = Dimens.margin_zero, this.onPress}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CardState();
  }
}