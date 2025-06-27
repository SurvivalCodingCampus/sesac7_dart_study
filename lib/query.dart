import 'package:collection/collection.dart';
import 'dart:math';


class Trader {
  String name;
  String city;
  Trader(this.name, this.city);

  @override
  String toString() {
    return '$name, $city';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;
  Transaction(this.trader, this.year, this.value);
  
  @override
  String toString() {
    return '$trader, $year, $value';
  }
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
  
  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  print('1번: ${transactions
    .where((e) => e.year == 2011)
    .sorted((a, b) => a.value.compareTo(b.value))
    .map((e) => e.trader.name)}'
  );

  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  print('2번: ${transactions
    .map((e) => e.trader.city)
    .toSet()}'
  );

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  final three = transactions
    .where((e) => e.trader.city == 'Cambridge')
    .map((e) => e.trader.name)
    .sorted((a, b) => a.compareTo(b))
    .toList();

  print('3번: $three');

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  final four = transactions
    .map((e) => e.trader.name)
    .sorted((a, b) => a.compareTo(b));

  print('4번: $four');

  // 5. 밀라노에 거래자가 있는가?
  final five = transactions
    .where((e) => e.trader.city == 'Milan')
    .map((e) => e.trader.name);

  print(five);

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  final six = transactions
    .where((e) => e.trader.city == 'Cambridge')
    .map((e) => '${e.trader.name}: ${e.value}');

  print(six);

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  final seven = transactions
    .map((e) => e.value)
    .reduce((a, b) => max(a, b));

  print(seven);

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  final eight = transactions
    .map((e) => e.value)
    .reduce((a, b) => min(a, b));

  print(eight);
}