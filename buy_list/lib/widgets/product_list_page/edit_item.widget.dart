import 'package:buy_list/models/shopping_list.model.dart';
import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  const EditItem({super.key, required this.item});

  final ShoppingList item;

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  late final TextEditingController nameController;
  late final TextEditingController priceController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.item.name);
    priceController = TextEditingController(
      text: widget.item.price.toStringAsFixed(2),
    );
  }

  void updateItem() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final name = nameController.text.trim();
    final priceText = priceController.text.trim().replaceAll(',', '.');
    final price = double.parse(priceText);
    setState(() {
      widget.item.name = name;
      widget.item.price = price;
    });
    Navigator.of(context).pop(true);
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Atualizar Item',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191919),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(thickness: 2, height: 0),
            SizedBox(height: 12),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Nome do item',
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo obrigatorio';
                }
                return null;
              },
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Preco',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo obrigatorio';
                }
                final parsed = double.tryParse(
                  value.trim().replaceAll(',', '.'),
                );
                if (parsed == null) {
                  return 'Preco invalido';
                }
                return null;
              },
              onFieldSubmitted: (_) => updateItem(),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: updateItem,
                  child: Text(
                    'Atualizar',
                    style: TextStyle(color: Color(0xFF2196F3)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
