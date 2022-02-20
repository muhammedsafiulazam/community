
class Container {

  // Properties.
  int capacity;
  List<int> values = List.empty(growable: true);

  Container(int value, {this.capacity = 10}) {
    values.add(value);
  }

  int get value {
    int vle = 0;
    for (var element in values) {
      vle += element;
    }
    return vle;
  }

  int get remains {
    return capacity - value;
  }

  String get information {
    String fce = "";
    for (var element in values) {
      fce += "$element";
    }
    return fce;
  }
}