import 'dart:math';

import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  print(transactions.map((e) => e.value).min);

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  print(transactions.map((e) => e.value).fold<int>(0, max));

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  print(
    transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.value),
  );

  // 5. 밀라노에 거래자가 있는가?
  print(transactions.any((e) => e.trader.city == 'Milan'));

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  print(transactions.map((e) => e.trader.name).toSet().sorted());

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  print(
    transactions
        .where((e) => e.trader.city == 'Cambridge')
        .sortedBy((e) => e.trader.name)
        .map((e) => e.trader.name)
        .toSet(),
  );

  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  print(
    transactions.map((e) => e.trader.city).toSet(),
  );

  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  print(
    transactions
        .where((e) => e.year == 2011)
        .sortedBy((e) => e.value)
        .map((e) => e.trader.name),
  );
}
