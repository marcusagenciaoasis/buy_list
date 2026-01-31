import 'package:buy_list/models/shopping_list.model.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void addItem() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final name = nameController.text.trim();
    final priceText = priceController.text.trim().replaceAll(',', '.');
    final price = double.parse(priceText);
    Navigator.of(context).pop(ShoppingList(name: name, price: price));
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
                  'Adicionar Item',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
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
              key: Key("inputItem"),
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
              key: Key("inputValue"),
              controller: priceController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'R\$ 0,00',
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
              onFieldSubmitted: (_) => addItem(),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  key: Key("addItemBtn"),
                  onPressed: addItem,
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
