import 'package:buy_list/models/shopping_list_group.model.dart';
import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final List<ShoppingListGroup> shoppingLists = [];
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
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/lista-de-compras.png',
              width: 140,
              height: 100,
            ),
            SizedBox(height: 40),
            Text(
              'Crie sua primeira lista',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              'Toque no botão azul',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Spacer(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        key: Key("addListBtn"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(600)),
        onPressed: () {
          Navigator.pushNamed(context, '/create_shopping_list');
        },
        backgroundColor: Color(0xFF2195F2),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
