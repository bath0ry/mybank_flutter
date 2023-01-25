import 'package:alubank_flutter/data/bank_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Bank model deposit should turns into 10', () {
    final bank = BankModel();
    bank.deposit(10);
    expect(bank.points, (10));
  });
}
