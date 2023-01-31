import 'package:alubank_flutter/components/view/recent_activity_widget.dart';
import 'package:alubank_flutter/data/bank_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //teste de unidade (teste do bank model)
  group("Bank model deposit tests ", () {
    test('Bank model deposit should turns into 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.points, (10));
    });
    test('Bank model earned should turns into 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.earned, (10));
    });
    test('Bank model available should turns into 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.available, (10));
    });
  });
  group('Bank model transfer tests', () {
    test('Bank model transfer should turns into 10', () {
      final bank = BankModel();
      bank.transfer(10);
      expect(bank.points, (10));
    });
    test('Bank model spent should turns into 10', () {
      final bank = BankModel();
      bank.transfer(10);
      expect(bank.spent, (10));
    });
    test('Bank model available should turns into -10', () {
      final bank = BankModel();
      bank.transfer(10);
      expect(bank.available, (-10));
    });
  });
}
