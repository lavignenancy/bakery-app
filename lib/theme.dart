import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppColors {
  static const cream = Color(0xFFFDF7F0);
  static const peach = Color(0xFFF9E4D4);
  static const card = Color(0xFFF3E7DB);
  static const orange = Color(0xFFF2A65A);
  static const orangeDeep = Color(0xFFE88C34);
  static const textDark = Color(0xFF2B2117);
  static const textFaded = Color(0xFFA08F7E);
  static const white = Colors.white;
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.orange,
        secondary: AppColors.orangeDeep,
        surface: AppColors.cream,
      ),
      textTheme: GoogleFonts.sourceSerif4TextTheme(base.textTheme).apply(
        bodyColor: AppColors.textDark,
        displayColor: AppColors.textDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
