import 'package:buy_list/models/shopping_list_group.model.dart';
import 'package:buy_list/widgets/shopping_list_empty_view.widget.dart';
import 'package:buy_list/widgets/shopping_list_group_view.widget.dart';
import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final List<ShoppingListGroup> shoppingLists = [];

  Future<void> addNewList() async {
    final newList = await Navigator.pushNamed(context, '/create_shopping_list');
    if (!mounted) return;

    if (newList != null && newList is ShoppingListGroup) {
      setState(() {
        shoppingLists.add(newList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key("appBarTitle"),
        title: Text('Minhas listas', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Color(0xFF4CAF50),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.diamond),
            color: Color(0xFFFFC107),
          ),
        ],
      ),
      body: shoppingLists.isEmpty
          ? ShoppingListEmptyView(key: Key("emptyListImage"))
          : ShoppingListGroupView(
              shoppingLists: shoppingLists,
              key: Key("shoppingListCard"),
            ),

      floatingActionButton: FloatingActionButton(
        key: Key("addListBtn"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(600)),
        onPressed: () {
          addNewList();
        },
        backgroundColor: Color(0xFF2195F2),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
