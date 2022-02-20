/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'TextWidget.dart';

/// Text state.
class TextState extends State<TextWidget> {

	@override
	Widget build(BuildContext context) {
		// Theme.
		ThemeData themeData = Theme.of(context);

		return Container(
				width: widget.width,
				height: widget.height,
				padding: widget.padding,
				margin: widget.margin,
				child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,
						mainAxisSize: MainAxisSize.min,
						children: List<Widget>.from([
							widget.over == null ? null
									: Container(
									margin: EdgeInsets.only(bottom: Dimens.margin_small.bottom),
									child: Text(widget.over!, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, style: themeData.textTheme.caption)),
							Text(widget.text!, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, style: themeData.textTheme.subtitle1),
							widget.under == null ? null
									: Container(
									margin: EdgeInsets.only(top: Dimens.margin_small.top),
									child: Text(widget.under!, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, style: themeData.textTheme.caption))
						].where((element) => element != null))
				)
		);
	}
}