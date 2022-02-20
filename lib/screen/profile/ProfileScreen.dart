
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/localization/i18n_ext.dart';
import 'package:community/service/user/dto/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'ProfileScreenWidget.dart';

/// Profile screen.
class ProfileScreen extends Screen<ProfileScreenWidget> {

  // Properties.
  late User _mUser;
  ImageProvider? _mAvatar;

  @override
  void onCreate() {
    super.onCreate();

    // User data.
    _mUser = widget.data;
    String? imageUrl = _mUser.picture?.medium;
    if (imageUrl != null) {
      _mAvatar = NetworkImage(imageUrl);
    }
  }

  @override
  AppBar? buildAppBar(BuildContext context) {
    String name = "${_mUser.name?.first} ${_mUser.name?.last}";
    return AppBar(title: Text(name.trim()));
  }

  Widget _buildAvatar(BuildContext context) {
    // Theme.
    ThemeData themeData = Theme.of(context);

    // Child.
    Widget? child = LayoutBuilder(builder: (context, constraint) {
      return Icon(Icons.account_circle, size: constraint.biggest.height);
    });

    return Center(
      child: Container(
        margin: Dimens.margin_medium,
        child: CircleAvatar(
            radius: Dimens.radius_xxlarge,
            foregroundImage: _mAvatar,
            backgroundColor: themeData.primaryColor,
            child: child
        )
      )
    );
  }

  Widget _buildFirstName(BuildContext context) {
    return Container(
      margin: Dimens.margin_medium.copyWith(bottom: 0),
      child: CardWidget(
          corner: Dimens.border_radius_small,
          child: TextWidget(
              over: I18nExt.name_first,
              text: _mUser.name?.first ?? I18n.na
          )
      )
    );
  }

  Widget _buildLastName(BuildContext context) {
    return Container(
        margin: Dimens.margin_medium.copyWith(bottom: 0),
        child: CardWidget(
            corner: Dimens.border_radius_small,
            child: TextWidget(
                over: I18nExt.name_last,
                text: _mUser.name?.last ?? I18n.na
            )
        )
    );
  }

  Widget _buildNationality(BuildContext context) {
    return Container(
        margin: Dimens.margin_medium.copyWith(bottom: 0),
        child: CardWidget(
            corner: Dimens.border_radius_small,
            child: TextWidget(
                over: I18nExt.nationality,
                text: _mUser.nationality ?? I18n.na
            )
        )
    );
  }

  Widget _buildGender(BuildContext context) {
    String? gender;
    if (_mUser.gender == User.GENDER_MALE) {
      gender = I18nExt.male;
    } else if (_mUser.gender == User.GENDER_FEMALE) {
      gender = I18nExt.female;
    }

    return Container(
        margin: Dimens.margin_medium,
        child: CardWidget(
            corner: Dimens.border_radius_small,
            child: TextWidget(
                over: I18nExt.gender,
                text: gender ?? I18n.na
            )
        )
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildAvatar(context),
          Flexible(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildFirstName(context),
                      _buildLastName(context),
                      _buildNationality(context),
                      _buildGender(context)
                    ]
                )
            )
          )
        ]
    );
  }
}