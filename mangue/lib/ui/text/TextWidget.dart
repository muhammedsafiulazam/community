
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'TextState.dart';

/// Text widget.
class TextWidget extends StatefulWidget {

	/// Over.
	String? over;

	/// Title.
	String? text;

	/// Under.
	String? under;

	/// Width.
	double? width;

	/// Height.
	double? height;

	/// Padding.
	EdgeInsets padding;

	/// Margin.
	EdgeInsets margin;

	TextWidget({Key? key, this.over, required this.text, this.under, this.width, this.height, this.padding = Dimens.padding_small, this.margin = Dimens.margin_zero}) : super(key: key);

	@override
	State<StatefulWidget> createState() {
		return TextState();
	}
}