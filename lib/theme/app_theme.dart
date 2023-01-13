import 'package:alubank_flutter/theme/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData AppTheme = ThemeData(
    primaryColor: ThemeColors.primaryColor,
    primarySwatch: ThemeColors.primaryColor,
    brightness: Brightness.dark,
    fontFamily: 'Raleway',
    textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
        bodyLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w400)));
