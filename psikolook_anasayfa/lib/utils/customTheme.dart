import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/utils/customColors.dart';

class CustomTheme {
  static ThemeData get pinkTheme {
    return ThemeData(
      backgroundColor: CustomColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: CustomColors.backgroundColor,
      ),
    );
  }
}
