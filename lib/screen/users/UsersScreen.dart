
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/localization/i18n_ext.dart';
import 'package:community/navigation/NavigationKey.dart';
import 'package:community/service/user/IUserService.dart';
import 'package:community/service/user/dto/Results.dart';
import 'package:community/service/user/dto/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangue/mangue.dart';

import 'UsersScreenWidget.dart';

/// Users screen.
class UsersScreen extends Screen<UsersScreenWidget> {

  // Constants.
  static const int _COUNT_USERS = 50;

  // Managers.
  late final IScreenManager _mScreenManager = AddOnManager().getAddOn<IScreenManager>() as IScreenManager;
  late final IServiceManager _mServiceManager = AddOnManager().getAddOn<IServiceManager>() as IServiceManager;

  // Validators.
  final RegExp _mCharacterRegExp = RegExp("[A-Za-z]");

  // Properties.
  int _mPage = 1;
  GenericError? _mError;
  final List<User> _mUsers = List.empty(growable: true);
  Future<void>? _mFutureUsers;
  String? _mSearch;
  UniqueKey? _mSearchKey;


  @override
  void onCreate() {
    super.onCreate();

    // Load.
    _loadUsers();
  }

  @override
  AppBar? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(I18nExt.community)
    );
  }

  void _loadUsers() async {
    if (_mFutureUsers == null) {

      // User service.
      IUserService userService = _mServiceManager.getAddOn<IUserService>() as IUserService;

      _mError = null;
      _mFutureUsers = userService.getUsers(_mPage, _COUNT_USERS, callback: (event) {
        notifyUpdates(() {
          if (event.error != null) {
            _mError = event.error;
          } else {
            List<User>? users = (event.data as Results).users;
            if (users?.isNotEmpty ?? false) {
              _mUsers.addAll(users!);
              _mPage += 1;
            }
          }
        });

        _mFutureUsers = null;
      });
    }
  }

  List<User> _filterUsers(String? filter, List<User> users) {
    return users.where((element) {
      if (filter?.isNotEmpty ?? false) {
        String search = filter!.toLowerCase();
        String firstName = element.name?.first?.toLowerCase() ?? "";
        String lastName = element.name?.last?.toLowerCase() ?? "";
        return (firstName.startsWith(search)) || (lastName.startsWith(search));
      } else {
        return true;
      }
    }).toList();
  }
  
  Widget _buildSearch(BuildContext context) {
    return Container(
        margin: Dimens.margin_medium,
        child: TextField(
            key: _mSearchKey,
            decoration: InputDecoration(
                labelText: I18nExt.search,
                hintText: I18nExt.hints_search,
                suffix: GestureDetector(
                  child: Icon(Icons.cancel),
                  onTap: () {
                    notifyUpdates(() {
                      _mSearch = null;
                      _mSearchKey = UniqueKey();
                    });
                  },
                )
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.allow(_mCharacterRegExp)
            ],
            onChanged: (value) {
              notifyUpdates(() {
                _mSearch = value;
              });
            }
        )
    );
  }
  
  Widget _buildUsers(BuildContext context) {
    if (_mUsers.isNotEmpty) {

      List<User> filterUsers = _filterUsers(_mSearch, _mUsers);

      return CollectionWidget<Widget>(
        itemCount: () {
          return filterUsers.length;
        },
        itemForIndex: (index) {
          User user = filterUsers[index];

          String? firstName = user.name!.first;
          String? lastName = user.name!.last;
          String thumbnailUrl = user.picture!.thumbnail!;

          return TileWidget(
              padding: Dimens.padding_medium.copyWith(top: Dimens.margin_small.top, bottom: Dimens.margin_small.bottom),
              lead: CornerWidget(
                  child: Image.network(thumbnailUrl, fit: BoxFit.cover)
              ),
              label: firstName,
              under: lastName,
              trail: Icon(Icons.arrow_right),
              onPress: () {
                _onPressUser(user);
              }
          );

        },
        itemVisibility: (widget, visibility, widgets) {
          // Do nothing.
        },
        onEnd: () {
          // Reload.
          _loadUsers();
        },
      );

    } else if (_mError != null) {
      return LoaderUtils.createMessage(context, _mError?.message ?? I18n.error, button: ButtonWidget(
          label: I18n.retry,
          onPress: () {
            _loadUsers();
          }
      ));
    } else {
      return LoaderUtils.createActivity(context);
    }
  }

  @override
  Widget? buildContent(BuildContext context) {
    if (_mUsers.isNotEmpty) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildSearch(context),
            Expanded(
                child: _buildUsers(context)
            ),
          ]
      );

    } else if (_mError != null) {
      return LoaderUtils.createMessage(context, _mError?.message ?? I18n.error, button: ButtonWidget(
          label: I18n.retry,
          onPress: () {
            _loadUsers();
          }
      ));
    } else {
      return LoaderUtils.createActivity(context);
    }
  }

  void _onPressUser(User user) {
    // Launch profile screen.
    _mScreenManager.load(NavigationKey.PROFILE_SCREEN, data: user);
  }
}