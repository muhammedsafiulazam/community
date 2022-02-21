
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/algorithm/Algorithm.dart';
import 'package:community/localization/i18n_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangue/mangue.dart';

import 'AlgorithmScreenWidget.dart';

/// Algorithm screen.
class AlgorithmScreen extends Screen<AlgorithmScreenWidget> {

  // Validators.
  final RegExp _mNumberRegExp = RegExp("[1-9]");

  // Properties.
  String? _mProducts;
  UniqueKey? _mProductsKey;
  String? _mBoxes;

  @override
  void onCreate() {
    super.onCreate();
  }

  @override
  AppBar? buildAppBar(BuildContext context) {
    return AppBar(title: Text(I18nExt.algorithm));
  }

  Widget _buildProducts(BuildContext context) {
    return Container(
        margin: Dimens.margin_medium,
        child: TextField(
            key: _mProductsKey,
            decoration: InputDecoration(
              labelText: I18nExt.products,
              hintText: I18nExt.hints_products,
              suffix: GestureDetector(
                child: const Icon(Icons.cancel),
                onTap: () {
                  notifyUpdates(() {
                    _mProducts = null;
                    _mProductsKey = UniqueKey();
                    _mBoxes = null;
                  });
                }
              )
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.allow(_mNumberRegExp)
            ],
            onChanged: (value) {
              _mProducts = value;
            }
        )
    );
  }

  Widget _buildBoxes(BuildContext context) {
    return Container(
        margin: Dimens.margin_medium,
        child: CardWidget(
            corner: Dimens.border_radius_small,
            child: TextWidget(
                over: I18nExt.containers,
                text: _mBoxes ?? I18n.na
            )
        )
    );
  }

  Widget _buildCalculate(BuildContext context) {
    return Container(
        margin: Dimens.margin_medium,
        child: ButtonWidget(label: I18nExt.calculate,
        onPress: () {
          _onPressCalculate(context);
        })
    );
  }

  void _onPressCalculate(BuildContext context) {
    notifyUpdates(() {
      if (_mProducts?.isNotEmpty ?? false) {
        _mBoxes = Algorithm.calculate(_mProducts!);
      } else {
        _mBoxes = null;

        // Show error.
        SnackBar snackBar = SnackBar(content: Text(I18nExt.error_products));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildProducts(context),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildBoxes(context)
                    ]
                )
            )
          ),
          _buildCalculate(context)
        ]
    );
  }
}