import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
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
      body: SafeArea(child: Column(children: [])),
    );
  }
}
