import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:alubank_flutter/data/bank_inherited.dart';
import 'package:alubank_flutter/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My widget has "Spent"', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: HomePage()),
    ));
    final spentFinder = find.text('Saída');
    expect(spentFinder, findsOneWidget);
  });
  testWidgets('My widget has LinearProgressIndicator', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: HomePage()),
    ));

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
  testWidgets('My widget has ', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: HomePage()),
    ));
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxHome) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });
}
