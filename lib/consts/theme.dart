import'package:flutter/material.dart';
class Style {
  static ThemeData themeData(bool isDark, BuildContext context){
    return ThemeData(
      scaffoldBackgroundColor: isDark? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      primaryColor: Colors.blueAccent,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: isDark ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
        brightness: isDark ? Brightness.dark : Brightness.light
      ),
      cardColor: isDark ? const Color(0xFF0a0d2c) : const Color(0xFFF2FDFD),
      canvasColor: isDark ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDark ? const ColorScheme.dark(): const ColorScheme.light()
      ),
    );
  }
}
