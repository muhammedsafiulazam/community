
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Dimens.
class Dimens {

  // Margin.
  static const EdgeInsets margin_zero = EdgeInsets.all(0);
  static const EdgeInsets margin_xxsmall = EdgeInsets.all(2);
  static const EdgeInsets margin_xsmall = EdgeInsets.all(4);
  static const EdgeInsets margin_small = EdgeInsets.all(8);
  static const EdgeInsets margin_medium = EdgeInsets.all(16);
  static const EdgeInsets margin_large = EdgeInsets.all(24);
  static const EdgeInsets margin_xlarge = EdgeInsets.all(32);
  static const EdgeInsets margin_xxlarge = EdgeInsets.all(64);


  // Padding.
  static const EdgeInsets padding_zero = EdgeInsets.all(0);
  static const EdgeInsets padding_xxsmall = EdgeInsets.all(2);
  static const EdgeInsets padding_xsmall = EdgeInsets.all(4);
  static const EdgeInsets padding_small = EdgeInsets.all(8);
  static const EdgeInsets padding_medium = EdgeInsets.all(16);
  static const EdgeInsets padding_large = EdgeInsets.all(24);
  static const EdgeInsets padding_xlarge = EdgeInsets.all(32);
  static const EdgeInsets padding_xxlarge = EdgeInsets.all(64);

  // Radius.
  static const double radius_zero = 0;
  static const double radius_xxsmall = 2;
  static const double radius_xsmall = 4;
  static const double radius_small = 8;
  static const double radius_medium = 16;
  static const double radius_large = 24;
  static const double radius_xlarge = 32;
  static const double radius_xxlarge = 64;

  static const BorderRadius border_radius_zero = BorderRadius.all(Radius.circular(radius_zero));
  static const BorderRadius border_radius_xxsmall = BorderRadius.all(Radius.circular(radius_xxsmall));
  static const BorderRadius border_radius_xsmall = BorderRadius.all(Radius.circular(radius_xsmall));
  static const BorderRadius border_radius_small = BorderRadius.all(Radius.circular(radius_small));
  static const BorderRadius border_radius_medium = BorderRadius.all(Radius.circular(radius_medium));
  static const BorderRadius border_radius_large = BorderRadius.all(Radius.circular(radius_large));
  static const BorderRadius border_radius_xlarge = BorderRadius.all(Radius.circular(radius_xlarge));
  static const BorderRadius border_radius_xxlarge = BorderRadius.all(Radius.circular(radius_xxlarge));

  // Font size.
  static const double font_size_xxsmall = 4;
  static const double font_size_xsmall = 8;
  static const double font_size_small = 12;
  static const double font_size_medium = 16;
  static const double font_size_large = 20;
  static const double font_size_xlarge = 24;
  static const double font_size_xxlarge = 48;

  // Icon size.
  static const double icon_size_xxsmall = 4;
  static const double icon_size_xsmall = 8;
  static const double icon_size_small = 16;
  static const double icon_size_medium = 32;
  static const double icon_size_large = 48;
  static const double icon_size_xlarge = 64;
  static const double icon_size_xxlarge = 124;

  // Button size.
  static const double button_height = 44;
  static const double button_width_small = 150;
  static const double button_width_medium = 225;
  static const double button_width_large = 300;

  // Image size.
  static const BoxConstraints image_size_zero = BoxConstraints(minWidth: 0, maxWidth: 0, minHeight: 0, maxHeight: 0);
  static const BoxConstraints image_size_xxsmall = BoxConstraints(minWidth: 8, maxWidth: 16, minHeight: 8, maxHeight: 16);
  static const BoxConstraints image_size_xsmall = BoxConstraints(minWidth: 16, maxWidth: 32, minHeight: 16, maxHeight: 32);
  static const BoxConstraints image_size_small = BoxConstraints(minWidth: 32, maxWidth: 64, minHeight: 32, maxHeight: 64);
  static const BoxConstraints image_size_medium = BoxConstraints(minWidth: 64, maxWidth: 128, minHeight: 64, maxHeight: 128);
  static const BoxConstraints image_size_large = BoxConstraints(minWidth: 128, maxWidth: 256, minHeight: 128, maxHeight: 256);
  static const BoxConstraints image_size_xlarge = BoxConstraints(minWidth: 256, maxWidth: 512, minHeight: 256, maxHeight: 512);
  static const BoxConstraints image_size_xxlarge = BoxConstraints(minWidth: 512, maxWidth: 1024, minHeight: 512, maxHeight: 1024);
}