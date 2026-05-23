import 'package:buy_list/store/theme.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ConfigPage extends StatelessWidget {
  final store = GetIt.I.get<ThemeStore>();
  ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preferencias do usuário',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          key: Key("backBtn"),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: store.theMode,
          builder: (context, themeMode, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Aparência: '),
                DropdownButton<ThemeMode>(
                  value: themeMode,
                  underline: Container(height: 0),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 64),
                    child: Icon(Icons.arrow_drop_down),
                  ),
                  onChanged: (option) {
                    if (option != null) {
                      store.setThemeMode(option);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Dia'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Noite'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('Sistema'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
