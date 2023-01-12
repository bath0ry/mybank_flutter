import 'package:alubank_flutter/components/box_home_widget.dart';
import 'package:alubank_flutter/components/division_widget.dart';
import 'package:alubank_flutter/components/dot_widget.dart';
import 'package:alubank_flutter/components/recent_activity_widget.dart';
import 'package:alubank_flutter/components/view/header_widget.dart';
import 'package:alubank_flutter/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Header(), RecentActivity()],
      ),
    );
  }
}
