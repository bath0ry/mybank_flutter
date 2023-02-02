import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:alubank_flutter/components/view/division_widget.dart';
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
    testWidgets('My home has Diga-me como text button', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      final textButtonFinder = find.text('Diga-me como!');
      expect(textButtonFinder, findsOneWidget);
    });
    testWidgets('My home has division widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      final divisionFinder = find.byType(DivisionWidget);
      expect(divisionFinder, findsNWidgets(2));
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
    //deposit actions
    testWidgets('Earned value should turns into 10', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      await tester.tap(find.text('Depositar'));
      await tester.tap(find.text('Entrada'));
      await tester.pumpAndSettle();
      expect(find.text('\$10.0'), findsOneWidget);
    });
    testWidgets('Spent value should turns into 10', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      await tester.tap(find.text('Transferir'));
      await tester.tap(find.text('Saída'));
      await tester.pumpAndSettle();
      expect(find.text('\$10.0'), findsOneWidget);
    });
    testWidgets('Linear progress spent value should turns into 10',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      await tester.tap(find.text('Transferir'));
      await tester.tap(find.text('Saída'));
      await tester.pumpAndSettle();
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
    testWidgets('Total points value should turns into 10', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: const HomePage()),
      ));
      await tester.tap(find.text('Depositar'));
      await tester.tap(find.text('Pontos totais:'));
      await tester.pumpAndSettle();
      expect(find.text('0.0'), findsOneWidget);
    });

    group('Test actions widget balance value', (() {
      testWidgets('Balance value should turns into 10', (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: BankInherited(child: const HomePage()),
        ));
        await tester.tap(find.text('Depositar'));
        await tester.tap(find.text('Saldo Disponivel'));
        await tester.pumpAndSettle();
        expect(find.text('\$10.0'), findsOneWidget);
      });
      testWidgets('Balance value should turns into -10', (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: BankInherited(child: const HomePage()),
        ));
        await tester.tap(find.text('Transferir'));
        await tester.tap(find.text('Saldo Disponivel'));
        await tester.pumpAndSettle();
        expect(find.text('\$-10.0'), findsOneWidget);
      });
    }));
  });
}
