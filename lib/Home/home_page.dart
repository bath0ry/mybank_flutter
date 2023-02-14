import 'package:alubank_flutter/components/view/account_points_widget.dart';
import 'package:alubank_flutter/components/view/actions_account_widget.dart';

import 'package:alubank_flutter/components/view/header_widget.dart';

import 'package:flutter/material.dart';

import '../components/view/recent_activity_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.api});
  final Future<String> api;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Header(api: this.api),
            RecentActivity(),
            AccountActions(),
            AccountPoints()
          ],
        ),
      ]),
    );
  }
}
