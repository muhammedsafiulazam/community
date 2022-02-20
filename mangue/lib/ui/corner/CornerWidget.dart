/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/dimens/Dimens.dart';

class CornerWidget extends StatelessWidget {

	Widget child;
	BorderRadius radius;

	CornerWidget({Key? key, required this.child, this.radius = Dimens.border_radius_small}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	  return ClipRRect(
		  borderRadius: radius,
		  clipBehavior: Clip.antiAlias,
		  child: child
	  );
  }

}

