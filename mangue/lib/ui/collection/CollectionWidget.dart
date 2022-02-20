
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/ui/collection/CollectionState.dart';

/// Collection widget.
class CollectionWidget<T extends Widget> extends StatefulWidget {

  /// Item count callback.
  int Function() itemCount;

  /// Item for index callback.
  T Function(int index) itemForIndex;

  /// Item visibility changes callback.
  void Function(Widget widget, bool visibility, List<Widget> widgets)? itemVisibility;

  /// Scroll near start callback.
  VoidCallback? onStart;

  /// Scroll near end callback.
  VoidCallback? onEnd;

  /// Direction.
  Axis direction;

  /// Reverse.
  bool reverse = false;

  /// Visibility fraction.
  double visibilityFraction = 0;

  /// Start fraction.
  double startFraction = 0.25;

  /// End fraction.
  double endFraction = 0.75;

  /// Invoke [itemCount] and [itemForIndex] for collection.
  CollectionWidget({Key? key, required this.itemCount, required this.itemForIndex, this.itemVisibility, this.direction = Axis.vertical, this.reverse = false, this.visibilityFraction = 0, this.startFraction = 0.25, this.endFraction = 0.25, this.onStart, this.onEnd}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CollectionState();
  }
}