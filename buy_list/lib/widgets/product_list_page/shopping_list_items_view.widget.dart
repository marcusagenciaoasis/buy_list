import 'package:buy_list/models/shopping_list.model.dart';
import 'package:buy_list/widgets/product_list_page/summary_bar.widget.dart';
import 'package:flutter/material.dart';

class ShoppingListItemsView extends StatelessWidget {
  const ShoppingListItemsView({
    super.key,
    required this.title,
    required this.items,
    required this.unmarkedTotal,
    required this.markedTotal,
    required this.onToggleItem,
  });

  final String title;
  final List<ShoppingList> items;
  final double unmarkedTotal;
  final double markedTotal;
  final ValueChanged<ShoppingList> onToggleItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: items.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                const Divider(height: 1),
              ],
            ),
          );
        }

        if (index == items.length + 1) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 16, 12),
            child: SummaryBar(
              unmarkedTotal: unmarkedTotal,
              markedTotal: markedTotal,
            ),
          );
        }

        final item = items[index - 1];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          minLeadingWidth: 24,
          horizontalTitleGap: 12,
          leading: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              key: const Key('productCheckbox'),
              value: item.isCompleted,
              activeColor: Colors.green,
              checkColor: Colors.white,
              shape: const CircleBorder(),
              side: const BorderSide(color: Color(0xFF2195F2)),
              onChanged: (_) => onToggleItem(item),
            ),
          ),
          title: Text(
            item.name,
            style: TextStyle(
              color: item.isCompleted ? Colors.black45 : Colors.black87,
            ),
          ),
          trailing: Text(
            'R\$ ${item.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: item.isCompleted ? Colors.black45 : Colors.black87,
            ),
          ),
          onTap: () => onToggleItem(item),
        );
      },
    );
  }
}
