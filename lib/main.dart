import 'package:alubank_flutter/data/bank_inherited.dart';
import 'package:alubank_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme,
      home: BankInherited(child: HomePage()),
    );
  }
}
