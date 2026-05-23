import 'package:buy_list/pages/create_shopping_list_page.dart';
import 'package:buy_list/pages/shopping_lists_page.dart';
import 'package:buy_list/store/theme.store.dart';
import 'package:buy_list/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<ThemeStore>(ThemeStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GetIt.I.get<ThemeStore>().theMode,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Shopping List',
          debugShowCheckedModeBanner: false,
          routes: {
            '/shopping_lists': (context) => const ShoppingListPage(),
            '/create_shopping_list': (context) =>
                const CreateShoppingListPage(),
          },
          themeMode: themeMode,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          initialRoute: '/shopping_lists',
        );
      },
    );
  }
}
