import 'package:modu_3_dart_study/12_lamda_function/trader.dart';

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return '{trader: $trader, year: $year, value: $value}';
  }
}
