import 'package:flutter/material.dart';

class CustomColors {
  static const MaterialColor primaryColor = const MaterialColor(
    _primaryValue,
    const <int, Color>{
      50: Color(0xFFDFF9E6),
    100: Color(0xFFB4F0BF),
    200: Color(0xFF8AE697),
    300: Color(0xFF5FDD6E),
    400: Color(0xFF34D646),
    500: Color(_primaryValue),
    600: Color(0xFF1DC43D),
    700: Color(0xFF16AD34),
    800: Color(0xFF12962C),
    900: Color(0xFF0B7E23),
    },
  );

  static const int _primaryValue = 0xFF1ED760;
  static const Color alertColor = Color(0xFFE01B1B);
  // static const Color accentColor = Color(0xFF9C27B0);
  // static const Color textColor = Color(0xFF333333);
}
const Color bgPrimary = Color(0xFF090909);