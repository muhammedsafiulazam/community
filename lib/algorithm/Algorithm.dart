
/*
 * Copyright (c) 2022 Muhammed Safiul Azam
 * Unauthorized copying or redistribution of this file in source and binary forms via any medium is strictly prohibited.
 * All rights reserved.
 */

import 'package:community/algorithm/Container.dart';

class Algorithm {

  static int CONTAINER_CAPACITY = 10;

  static String calculate(String products) {
    // Values.
    List<Container> containers = List.empty(growable: true);

    // Parse products.
    products.split("").forEach((element) {
      containers.add(Container(int.parse(element), capacity: CONTAINER_CAPACITY));
    });

    containers = optimize(containers);

    String result = "";
    for (var container in containers) {
      result += (result.isNotEmpty ? "/" : "") + container.information;
    }
    return result;
  }

  static List<Container> optimize(List<Container> containers) {
    // Copy.
    List<Container> copy = List.from(containers);

    // Sort - asc.
    copy.sort((x, y) {
      return x.value.compareTo(y.value);
    });

    // Smallest item.
    Container first = copy.first;

    // Merge if possible.
    for (var i = copy.length - 1; i > 0; i--) {
      Container container = copy[i];
      if (container.value <= first.remains) {
        first.values.addAll(container.values);
        copy.remove(container);
        return optimize(copy);
      }
    }

    // Return.
    return copy;
  }
}