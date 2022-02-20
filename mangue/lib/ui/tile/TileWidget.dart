
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'TileState.dart';

/// Tile widget.
class TileWidget extends StatefulWidget {

	/// Lead.
	Widget? lead;

	/// Over.
	String? over;

	/// Label.
	String? label;

	/// Under.
	String? under;

	/// Trail.
	Widget? trail;

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

	TileWidget({Key? key, this.lead, this.over, required this.label, this.under, this.trail, this.width, this.height, this.padding = Dimens.padding_small, this.margin = Dimens.margin_zero, this.onPress}) : super(key: key);

	@override
	State<StatefulWidget> createState() {
		return TileState();
	}
}