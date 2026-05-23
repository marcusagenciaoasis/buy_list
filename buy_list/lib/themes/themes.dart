import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.copyWith(
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
      labelSmall: const TextStyle(fontSize: 12, color: Color(0xFF111111)),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4CAF50),
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 1,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2195F2),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF4CAF50),
      linearTrackColor: Color(0xFF9E9E9E),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF4CAF50),
      foregroundColor: Colors.white,
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark, // Indica ao Flutter que é um tema escuro
    fontFamily: "Montserrat",
    scaffoldBackgroundColor: const Color(0xFF121212), // Aplica a cor de fundo

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(color: Colors.white, fontSize: 12),
    ),

    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),

    iconTheme: const IconThemeData(color: Colors.white),

    dividerTheme: const DividerThemeData(color: Colors.white70),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF303030),
      modalBackgroundColor: Color(0xFF303030),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF4DB051)),
    ),

    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Color(0xFF000000),
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 1,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),

      hintStyle: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF2D5F2F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF4DB051), // Substitui o valueColor (cor da barra)
      linearTrackColor: Color(
        0xFFFFFFFF,
      ), // Substitui o backgroundColor exclusivo da barra linear
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF4CAF50),
      foregroundColor: Colors.white,
    ),
  );
}
