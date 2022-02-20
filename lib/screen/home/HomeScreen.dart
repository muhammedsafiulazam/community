
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/localization/i18n_ext.dart';
import 'package:community/screen/algorithm/AlgorithmScreenWidget.dart';
import 'package:community/screen/users/UsersScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:mangue/mangue.dart';

import 'HomeScreenWidget.dart';

/// Home screen.
class HomeScreen extends Screen<HomeScreenWidget> {

  // Constants.
  static const int _TABS_COUNT = 2;

  // Tab controller.
  late TabController _mTabController;

  @override
  void onCreate() {
    super.onCreate();

    _mTabController = TabController(initialIndex: 0, length: _TABS_COUNT, vsync: this);
  }

  @override
  Widget? buildContent(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: _buildTabsContent(context)),
          _buildTabs(context),
        ]
    );
  }

  TabBar _buildTabs(BuildContext context) {

    return TabBar(
        tabs: [
          Tab(text: I18nExt.users, icon: Icon(Icons.supervised_user_circle)),
          Tab(text: I18nExt.algorithm, icon: Icon(Icons.api))
        ],
        controller: _mTabController,
        labelColor: Colors.grey,
        indicatorColor: Colors.grey
    );
  }

  TabBarView _buildTabsContent(BuildContext context) {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: [UsersScreenWidget(), AlgorithmScreenWidget()],
        controller: _mTabController
    );
  }

  @override
  void onDispose() {
    super.onDispose();
  }
}