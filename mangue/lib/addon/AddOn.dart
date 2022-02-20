
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'IAddOn.dart';

/// AddOn.
class AddOn extends IAddOn {

  // Properties.
  Map<Type, IAddOn> _mAddOns = Map<Type, IAddOn>();

  AddOn();

  @override
  IAddOn? getAddOn<T extends IAddOn>() {
    return _mAddOns[T];
  }

  @override
  void addAddOn<T extends IAddOn>(IAddOn plugin) {
    _mAddOns[T] = plugin;
  }

  @override
  void removeAddOn<T extends IAddOn>() {
    _mAddOns.remove(T);
  }

  @override
  void cleanAddOns() {
    _mAddOns.clear();
  }
}