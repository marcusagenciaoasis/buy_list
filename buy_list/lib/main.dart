import 'package:buy_list/pages/create_shopping_list_page.dart';
import 'package:buy_list/pages/shopping_lists_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      debugShowCheckedModeBanner: false,
      routes: {
        '/shopping_lists': (context) => const ShoppingListPage(),
        '/create_shopping_list': (context) => const CreateShoppingListPage(),
      },
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/shopping_lists',
    );
  }
}
