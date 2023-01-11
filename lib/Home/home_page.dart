import 'package:alubank_flutter/components/box_home_widget.dart';
import 'package:alubank_flutter/components/view/header_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          BoxHome(
              boxComponent: Column(
            children: [],
          ))
        ],
      ),
    );
  }
}
