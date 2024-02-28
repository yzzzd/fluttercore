import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Collectable<T> extends Rx<T> {
  Collectable(super.initial);
}

class CollectableList<T> extends RxList<T> {
  CollectableList(super.initial);
}

class CollectableMap<K, V> extends RxMap<K, V> {
  CollectableMap(super.initial);
}

class CollectableSet<T> extends RxSet<T> {
  CollectableSet(super.initial);
}