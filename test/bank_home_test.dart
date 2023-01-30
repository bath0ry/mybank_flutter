import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:alubank_flutter/data/bank_inherited.dart';
import 'package:alubank_flutter/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //teste de widgets

  group('Widget tests', () {
    testWidgets('My widget has "Spent"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      final spentFinder = find.text('Saída');
      expect(spentFinder, findsOneWidget);
    });
    testWidgets('My widget has LinearProgressIndicator', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
    testWidgets('Finds 5 box card', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      expect(find.byWidgetPredicate((widget) {
        if (widget is BoxHome) {
          return true;
        } else {
          return false;
        }
      }), findsNWidgets(5));
    });
  });

  //teste de ações

  group('Actions tests', () {
    testWidgets('Earned value should turns into 10', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: HomePage()),
      ));
      await tester.tap(find.text('Depositar'));
      await tester.tap(find.text('Entrada'));
      await tester.pumpAndSettle();
      expect(find.text('\$10.0'), findsOneWidget);
    });
  });
}
