import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:alubank_flutter/components/view/division_widget.dart';
import 'package:alubank_flutter/data/bank_inherited.dart';
import 'package:alubank_flutter/data/bank_service.mocks.dart';
import 'package:alubank_flutter/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  //teste de widgets
  final MockBankService mockHttp = MockBankService();
  group('Widget tests', () {
    testWidgets('My widget has "Spent"', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: HomePage(api: mockHttp.getDolarToReal())),
      ));
      final spentFinder = find.text('Saída');
      expect(spentFinder, findsOneWidget);
    });
    testWidgets('My home has Diga-me como text button', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: HomePage(api: mockHttp.getDolarToReal())),
      ));
      final textButtonFinder = find.text('Diga-me como!');
      expect(textButtonFinder, findsOneWidget);
    });
    testWidgets('My home has division widget', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: HomePage(api: mockHttp.getDolarToReal())),
      ));
      final divisionFinder = find.byType(DivisionWidget);
      expect(divisionFinder, findsNWidgets(2));
    });
    testWidgets('My widget has LinearProgressIndicator', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: HomePage(api: mockHttp.getDolarToReal())),
      ));

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
    testWidgets('Finds 5 box card', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(child: HomePage(api: mockHttp.getDolarToReal())),
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
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: HomePage(
          api: mockHttp.getDolarToReal(),
        )),
      ));
      await tester.tap(find.text('Depositar'));
      await tester.tap(find.text('Entrada'));
      await tester.pumpAndSettle();
      expect(find.text('\$10.0'), findsOneWidget);
    });
    testWidgets('Spent value should turns into 10', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: HomePage(
          api: mockHttp.getDolarToReal(),
        )),
      ));
      await tester.tap(find.text('Transferir'));
      await tester.tap(find.text('Saída'));
      await tester.pumpAndSettle();
      expect(find.text('\$10.0'), findsOneWidget);
    });
    testWidgets('Linear progress spent value should turns into 10',
        (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: HomePage(
          api: mockHttp.getDolarToReal(),
        )),
      ));
      await tester.tap(find.text('Transferir'));
      await tester.tap(find.text('Saída'));
      await tester.pumpAndSettle();
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
    testWidgets('Total points value should turns into 10', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: HomePage(
          api: mockHttp.getDolarToReal(),
        )),
      ));
      await tester.tap(find.text('Depositar'));
      await tester.tap(find.text('Pontos totais:'), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.text('0.0'), findsOneWidget);
    });

    group('Test actions widget balance value', (() {
      testWidgets('Balance value should turns into 10', (tester) async {
        when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
        await tester.pumpWidget(MaterialApp(
          home: BankInherited(
              child: HomePage(
            api: mockHttp.getDolarToReal(),
          )),
        ));
        await tester.tap(find.text('Depositar'));
        await tester.tap(find.text('Saldo Disponivel'));
        await tester.pumpAndSettle();
        expect(find.text('\$10.0'), findsOneWidget);
      });
      testWidgets('Balance value should turns into -10', (tester) async {
        when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
        await tester.pumpWidget(MaterialApp(
          home: BankInherited(
              child: HomePage(
            api: mockHttp.getDolarToReal(),
          )),
        ));
        await tester.tap(find.text('Transferir'));
        await tester.tap(find.text('Saldo Disponivel'));
        await tester.pumpAndSettle();
        expect(find.text('\$-10.0'), findsOneWidget);
      });
    }));
    testWidgets('Mock Bank test', (tester) async {
      when(mockHttp.getDolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
            child: HomePage(
          api: mockHttp.getDolarToReal(),
        )),
      ));

      verify(mockHttp.getDolarToReal()).called(12);
    });
  });
}
