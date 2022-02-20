
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

/// AddOn interface.
abstract class IAddOn {

  /// Gets addon.
  IAddOn? getAddOn<T extends IAddOn>();

  /// Adds addon.
  void addAddOn<T extends IAddOn>(IAddOn addon);

  /// Removes addon.
  void removeAddOn<T extends IAddOn>();

  /// Clean addons.
  void cleanAddOns();
}