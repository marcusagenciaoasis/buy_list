import 'package:buy_list/models/shopping_list_group.model.dart';
import 'package:buy_list/pages/config.page.dart';
import 'package:buy_list/pages/product_list_page.dart';
import 'package:buy_list/widgets/shopping_list/shopping_list_empty_view.widget.dart';
import 'package:buy_list/widgets/shopping_list/shopping_list_group_view.widget.dart';
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

  Future<void> openGroupDetails(ShoppingListGroup group) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductListPage(group: group)),
    );
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key("appBarTitle"),
        title: Text('Minhas listas', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.diamond),
            color: Color(0xFFFFC107),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ConfigPage()));
            },
            icon: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: shoppingLists.isEmpty
          ? ShoppingListEmptyView(key: Key("emptyListImage"))
          : ShoppingListGroupView(
              shoppingLists: shoppingLists,
              key: Key("shoppingListCard"),
              onTapGroup: openGroupDetails,
            ),

      floatingActionButton: FloatingActionButton(
        key: Key("addListBtn"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(600)),
        onPressed: () {
          addNewList();
        },

        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
