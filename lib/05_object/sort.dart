

import 'package:collection/collection.dart';

import '../hero.dart';

void main() {
  final List<int> numbers = [1, 3, 2];
  print(numbers);

  // 쓰지 말자
  // final List<int> sorted = numbers..sort((a, b) => -a.compareTo(b));   // 정렬    -2, 1

  final List<int> sorted = numbers.sorted((a, b) => -a.compareTo(b));   // 정렬    -2, 1
  print(sorted);   // 정렬된 상태? 원본?
  print(numbers);

  Comparable ccc = 10;
  Comparable ccc22 = 'dddd';

  List<Hero> heroes = [
    Hero(name: '홍길동', hp: 100),
    Hero(name: '김길동', hp: 50),
    Hero(name: '박길동', hp: 200),
  ];

  // heroes.sort();
  print(heroes.sorted((a, b) => -a.compareTo(b)));
}
