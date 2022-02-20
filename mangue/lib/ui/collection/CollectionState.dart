
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'CollectionWidget.dart';

/// Collection state.
class CollectionState<T extends Widget> extends State<CollectionWidget> {

  // Properties.
  final ScrollController _mScrollController = ScrollController();
  final Map<ValueKey, T> _mVisibilityTracker = Map();
  final List<T> _mVisibleItems = List.empty(growable: true);

  CollectionState() : super() {
    _mScrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _mScrollController,
      scrollDirection: widget.direction,
      reverse: widget.reverse,
      itemCount: widget.itemCount.call(),
      itemBuilder: (context, index) {
        
        T item = widget.itemForIndex(index) as T;
        
        return VisibilityDetector(
          key: ValueKey(index),
          child: item,
          onVisibilityChanged: (info) {
            if (info.visibleFraction > widget.visibilityFraction) {
              // Visible.
              if (!_mVisibilityTracker.containsKey(info.key)) {
                _mVisibilityTracker[info.key as ValueKey<dynamic>] = item;
              }
            }
            else {
              // Not visible.
              _mVisibilityTracker.removeWhere((key, item) => key == info.key);
            }

            // Sort keys.
            List<ValueKey> keys = _mVisibilityTracker.keys.toList();
            keys.sort((x, y) {
              if (x.value < y.value) {
                return -1;
              } else if (x.value > y.value) {
                return 1;
              } else {
                return 0;
              }
            });

            // Clear items.
            _mVisibleItems.clear();

            // Add items.
            keys.forEach((key) {
                T? value = _mVisibilityTracker[key];
                if (value != null) {
                    _mVisibleItems.add(value);
                }
            });

            // On visibility.
            widget.itemVisibility?.call(item, info.visibleFraction > widget.visibilityFraction, _mVisibleItems);
          }
        );
      });
  }

  void _onScroll() {
    var nearStart = widget.startFraction * _mScrollController.position.extentInside;
    if (_mScrollController.position.pixels < _mScrollController.position.minScrollExtent + nearStart) {
      widget.onStart?.call();
    }

    var nearEnd = widget.endFraction * _mScrollController.position.extentInside;
    if (_mScrollController.position.pixels > _mScrollController.position.maxScrollExtent - nearEnd) {
      widget.onEnd?.call();
    }
  }
}