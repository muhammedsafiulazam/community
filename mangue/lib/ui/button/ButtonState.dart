
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:mangue/dimens/Dimens.dart';
import 'package:mangue/ui/corner/CornerWidget.dart';

import 'ButtonWidget.dart';

/// Button state.
class ButtonState extends State<ButtonWidget> {

  @override
  Widget build(BuildContext context) {
      // Theme.
      ThemeData themeData = Theme.of(context);

      return CornerWidget(
          child: Material(
              child: InkWell(
                  child: Container(
                      width: widget.width,
                      height: widget.height,
                      padding: widget.padding,
                      margin: widget.margin,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: List<Widget>.from([
                            Icon(widget.lead?.icon, color: themeData.textTheme.button?.color),
                            Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: Dimens.margin_small.left, right: Dimens.margin_small.right),
                                    child: Text(widget.label!, overflow: TextOverflow.ellipsis, style: themeData.textTheme.button))
                            ),
                            Icon(widget.trail?.icon, color: themeData.textTheme.button?.color)
                          ].where((element) => element != null))
                      )
                  ),
                  onTap: () {
                    widget.onPress?.call();
                  }
              ),
              color: themeData.buttonTheme.colorScheme?.primary
          ),
        radius: widget.corner
      );
  }
}