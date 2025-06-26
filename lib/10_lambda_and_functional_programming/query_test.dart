import 'dart:math';

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/10_lambda_and_functional_programming/trader.dart';
import 'package:modu_3_dart_study/10_lambda_and_functional_programming/transaction.dart';

void main() {
  final transactions = [
    Transaction(
      trader: Trader(name: 'Brian', city: 'Cambridge'),
      year: 2011,
      value: 300,
    ),
    Transaction(
      trader: Trader(name: 'Raoul', city: 'Cambridge'),
      year: 2012,
      value: 1000,
    ),
    Transaction(
      trader: Trader(name: 'Raoul', city: 'Cambridge'),
      year: 2011,
      value: 400,
    ),
    Transaction(
      trader: Trader(name: 'Mario', city: 'Milan'),
      year: 2012,
      value: 710,
    ),
    Transaction(
      trader: Trader(name: 'Mario', city: 'Milan'),
      year: 2012,
      value: 700,
    ),
    Transaction(
      trader: Trader(name: 'Alan', city: 'Cambridge'),
      year: 2012,
      value: 950,
    ),
  ];

  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  print(
    transactions
        .where((e) => e.year == 2011)
        .map((e) => e.value)
        .sorted((a, b) => a.compareTo(b))
        .toList(),
  );
  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  print(transactions.map((e) => e.trader.city).toSet());
  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  print(
    transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.trader.name)
        .sorted((a, b) => a.compareTo(b))
        .toList(),
  );
  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  print(
    transactions
        .map((e) => e.trader.name)
        .sorted((a, b) => a.compareTo(b))
        .toList(),
  );
  // 5. 밀라노에 거래자가 있는가?
  print(transactions.any((e) => e.trader.city == 'Milan'));
  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  print(
    transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.value),
  );
  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  print(transactions.map((e) => e.value).reduce(max));
  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  print(transactions.map((e) => e.value).reduce(min));
}
