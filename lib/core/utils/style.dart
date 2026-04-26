import 'package:flutter/material.dart';

import 'color.dart';

class Style
{
  static ThemeData themeData({
    required bool isDark,
}){
    return ThemeData(
      scaffoldBackgroundColor: isDark?AppColors.darkScaffoldColor:AppColors.lightScaffoldColor,
      brightness: isDark?Brightness.dark:Brightness.light,
      cardColor: isDark?const Color.fromARGB(255, 13, 6, 37):AppColors.lightCardColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: isDark?AppColors.darkScaffoldColor:AppColors.lightScaffoldColor,
        titleTextStyle: TextStyle(
          color: isDark?AppColors.lightScaffoldColor:AppColors.darkScaffoldColor,
        ),
      ),
    );
  }
}

class StyleText
{
  static TextStyle style20({Color color= AppColors.darkScaffoldColor})=>TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
    color: color,
  );
  static TextStyle style18=const TextStyle(
  fontSize: 16,
  );
  static TextStyle style16= const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
  static TextStyle style40= const TextStyle(
    fontSize: 40,
    color: Colors.red,
  );
}