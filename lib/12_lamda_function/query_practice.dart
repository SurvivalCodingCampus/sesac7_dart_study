import 'dart:math';

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/12_lamda_function/trader.dart';
import 'package:modu_3_dart_study/12_lamda_function/transaction.dart';

void main() {
  final transactions = [
    Transaction(Trader('Brian', 'Cambridge'), 2011, 300),
    Transaction(Trader('Raoul', 'Cambridge'), 2012, 1000),
    Transaction(Trader('Raoul', 'Cambridge'), 2011, 400),
    Transaction(Trader('Mario', 'Milan'), 2012, 710),
    Transaction(Trader('Mario', 'Milan'), 2012, 700),
    Transaction(Trader('Alan', 'Cambridge'), 2012, 950),
  ];

  // 1번
  print(transactions.where((e) => e.year == 2011).sortedBy((e) => -e.value));

  // 2번
  print(transactions.map((e) => e.trader.city).toSet());

  // 3번
  print(
    transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.trader.name)
        .sorted()
        .toSet(),
  );

  // 4번
  print(transactions.map((e) => e.trader.name).sorted().toSet());

  // 5번
  print(transactions.any((e) => e.trader.city == 'Milan'));

  // 6번
  print(
    transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.value),
  );

  // 7번
  print(transactions.map((e) => e.value).reduce((e, v) => max(e, v)));

  // 8번
  print(transactions.map((e) => e.value).reduce((e, v) => min(e, v)));
}
