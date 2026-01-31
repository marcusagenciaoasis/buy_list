import 'package:buy_list/models/shopping_list.model.dart';

class ShoppingListGroup {
  String name;
  List<ShoppingList> items;

  ShoppingListGroup({required this.name, List<ShoppingList>? items})
    : items = items ?? [];

  void addItem(ShoppingList item) {
    items.add(item);
  }

  int get completedCount {
    return items.where((item) => item.isCompleted).length;
  }

  double get progress {
    if (items.isEmpty) {
      return 0;
    }
    return completedCount / items.length;
  }
}
