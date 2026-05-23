import 'package:buy_list/models/shopping_list_group.model.dart';
import 'package:flutter/material.dart';

class CreateShoppingListPage extends StatefulWidget {
  const CreateShoppingListPage({super.key});

  @override
  State<CreateShoppingListPage> createState() => _CreateShoppingListPageState();
}

class _CreateShoppingListPageState extends State<CreateShoppingListPage> {
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void createList() {
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
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : const Color(0xFF2195F2),
      body: SafeArea(
        child: AnimatedPadding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 24 + viewInsets),
          curve: Curves.easeOut,
          duration: Duration(milliseconds: 300),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                TextFormField(
                  key: Key("listNameInput"),
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Nome da lista',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) => createList(),
                ),

                const Spacer(),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        key: Key("backToListsBtn"),
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text('Voltar'),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton(
                        key: Key("createListBtn"),
                        onPressed: createList,

                        child: const Text('Criar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
