import 'dart:collection';

extension ListWithDuplicates<T> on List<T> {
  void removeDuplicates() {
    final set = LinkedHashSet<T>.from(this);
    clear();
    addAll(set);
  }
}