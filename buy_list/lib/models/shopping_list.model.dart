class ShoppingList {
  String name;
  double price;

  bool isCompleted;

  ShoppingList({required this.name, required this.price}) : isCompleted = false;

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
