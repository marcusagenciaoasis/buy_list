import 'package:buy_list/models/shopping_list.model.dart';

class ShoppingListGroup {
  String name;
  List<ShoppingList> items;

  ShoppingListGroup({required this.name, List<ShoppingList>? items})
    : items = items ?? [];

  void addItem(ShoppingList item) {
    items.add(item);
  }
  
}
