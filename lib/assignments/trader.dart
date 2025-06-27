import 'dart:math';

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
  print('1. 2011년에 일어난 모든 트랜잭션을 찾아 거래액 기준 오름차순으로 정리하여 이름을 나열하시오');
  (transactions.where((values) => values.year == 2011).toList()
        ..sort((a, b) => a.value.compareTo(b.value)))
      .forEach((values) => print(values.trader.name));

  print('\n2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오');
  transactions.map((values) => values.trader.city).toSet().forEach(print);

  print('\n3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오');
  (transactions
          .where((values) => values.trader.city == 'Cambridge')
          .map((values) => values.trader.name)
          .toSet()
          .toList()
        ..sort())
      .forEach(print);

  print('\n4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오');
  (transactions.map((values) => values.trader.name).toSet().toList()..sort())
      .forEach(print);

  print('\n5. 밀라노에 거래자가 있는가?');
  bool isInMilan = transactions.any((values) => values.trader.city == 'Milan');
  print(isInMilan);

  print('\n6. 케임브리지에 거주하는 거래자의 모든 트랜잭션값을 출력하시오');
  transactions
      .where((values) => values.trader.city == 'Cambridge')
      .map((values) => values.value)
      .forEach(print);

  print('\n7. 전체 트랜잭션 중 최대값은 얼마인가?');
  int maxValue = transactions.map((values) => values.value).reduce(max);
  print(maxValue);

  print('\n8. 전체 트랜잭션 중 최소값은 얼마인가?');
  int minValue = transactions.map((values) => values.value).reduce(min);
  print(minValue);
}
