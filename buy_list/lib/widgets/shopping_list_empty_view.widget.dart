import 'package:flutter/material.dart';

class ShoppingListEmptyView extends StatelessWidget {
  const ShoppingListEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
