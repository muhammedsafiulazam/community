/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:mangue/dimens/Dimens.dart';
import 'package:mangue/mangue.dart';

import 'TileWidget.dart';

/// Tile state.
class TileState extends State<TileWidget> {

	@override
	Widget build(BuildContext context) {
		return Material(
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
											widget.lead == null ? null
													: Container(
													margin: EdgeInsets.only(right: Dimens.margin_small.right),
													child: widget.lead
											),
											Flexible(
													child: TextWidget(over: widget.over, text: widget.label, under: widget.under, padding: Dimens.padding_zero)
											),
											widget.trail == null ? null
													: Container(
													margin: EdgeInsets.only(left: Dimens.margin_small.left),
													child: widget.trail
											)
										].where((element) => element != null)
										))
						),
						onTap: () {
							widget.onPress?.call();
						}
				)
		);
	}
}