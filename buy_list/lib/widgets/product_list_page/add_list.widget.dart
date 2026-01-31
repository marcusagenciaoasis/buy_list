import 'package:buy_list/models/shopping_list_group.model.dart';
import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final titleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addList() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final list = ShoppingListGroup(name: titleController.text.trim());
    Navigator.of(context).pop(list);
  }

  @override
  void dispose() {
    titleController.dispose();
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
                  "Adicionar lista",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),

                Spacer(),

                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),

            Divider(thickness: 2, height: 0),

            SizedBox(height: 15),

            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nome da lista",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            Row(
              children: [
                Spacer(),
                TextButton(onPressed: addList, child: Text("Adicionar")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
