import 'package:buy_list/models/shopping_list.model.dart';
import 'package:buy_list/models/shopping_list_group.model.dart';
import 'package:buy_list/widgets/product_list_page/add_item.widget.dart';
import 'package:buy_list/widgets/product_list_page/edit_item.widget.dart';
import 'package:buy_list/widgets/product_list_page/shopping_list_items_view.widget.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key, required this.group});

  final ShoppingListGroup group;

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<void> updateMarkedItem() async {
    final markedItems = widget.group.items
        .where((item) => item.isCompleted)
        .toList();

    if (markedItems.isEmpty) return;

    final markedItem = markedItems.first;

    final updated = await showModalBottomSheet<bool>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => EditItem(item: markedItem),
    );

    if (!mounted || updated != true) return;

    setState(() {});
  }

  Future<void> addItem() async {
    final newItem = await showModalBottomSheet<ShoppingList>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const AddItem(),
    );

    if (!mounted || newItem == null) {
      return;
    }

    setState(() {
      widget.group.addItem(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.group.items;
    final unmarkedTotal = widget.group.unmarkedTotal;
    final markedTotal = widget.group.markedTotal;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 1,

        leading: IconButton(
          key: Key("backBtn"),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            key: Key("updateListBtn"),
            onPressed: updateMarkedItem,
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Atualizar'),
          ),
        ],
      ),

      body: ShoppingListItemsView(
        title: widget.group.name,
        items: items,
        unmarkedTotal: unmarkedTotal,
        markedTotal: markedTotal,
        onToggleItem: (item) {
          setState(() {
            item.toggleCompleted();
          });
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        key: Key("addNewItemBtn"),
        onPressed: addItem,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(600)),

        label: const Text('Adicionar'),
      ),
    );
  }
}
