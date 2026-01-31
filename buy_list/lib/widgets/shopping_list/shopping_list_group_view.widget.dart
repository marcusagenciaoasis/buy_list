import 'package:buy_list/models/shopping_list_group.model.dart';
import 'package:flutter/material.dart';

class ShoppingListGroupView extends StatelessWidget {
  const ShoppingListGroupView({
    super.key,
    required this.shoppingLists,
    required this.onTapGroup,
  });

  final List<ShoppingListGroup> shoppingLists;
  final void Function(ShoppingListGroup) onTapGroup;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: shoppingLists.length,
      itemBuilder: (context, index) {
        final group = shoppingLists[index];
        final progress = group.progress;
        final completed = group.completedCount;
        final total = group.items.length;

        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () => onTapGroup(group),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(group.name),

                      Text(
                        '$completed/$total',
                        style: TextStyle(color: Color(0xFF4CAF50)),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  LinearProgressIndicator(
                    value: progress,

                    backgroundColor: Color(0xFF9E9E9E),

                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
