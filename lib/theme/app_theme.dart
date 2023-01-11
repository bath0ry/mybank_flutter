import 'package:alubank_flutter/theme/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData AppTheme = ThemeData(
    primaryColor: ThemeColors.primaryColor,
    primarySwatch: ThemeColors.primaryColor,
    brightness: Brightness.dark,
    textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 20),
        bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)));
