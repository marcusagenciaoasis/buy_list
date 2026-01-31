import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50),
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
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Atualizar'),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        key: Key("addNewItemBtn"),
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(600)),
        backgroundColor: const Color(0xFF2195F2),
        label: const Text('Adicionar', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
