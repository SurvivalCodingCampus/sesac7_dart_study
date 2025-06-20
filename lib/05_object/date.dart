import 'dart:math';

import 'package:collection/collection.dart';

import '../hero.dart';

extension StringExtension on String {
  int toInt() {
    return int.parse(this);
  }
}

void main() {
  DateTime today = DateTime.now();

  String name = '1';
  int number = name.toInt();


  final copyDate1 = DateTime(today.year, today.month, today.day);
  final copyDate2 = today.copyWith();
  print(today.copyWith());

  Person person = Person.aaa();
  Person.bbb();

  'aaa'.compareTo('dd');

  List<Hero> heroes = [
    Hero(name: '홍길동', hp: 100),
    Hero(name: '김길동', hp: 50),
    Hero(name: '박길동', hp: 200),
  ];

  List<Hero> sortedHeroes = heroes.sortedBy((hero) => hero.hp);

  List<Hero> expected = [
    Hero(name: '김길동', hp: 50),
    Hero(name: '홍길동', hp: 100),
    Hero(name: '박길동', hp: 200),
  ];

  final equality = ListEquality();
  print(equality.equals(sortedHeroes, expected));

  List<Hero> newList = [
    heroes[0].copyWith(),
    Hero(name: '신상임당', hp: 200),
  ];

  newList[0].hp = -100;
}

class Person implements Comparable<Person> {
  // final int hp;
  // final String name;

  static void bbb() {}

  Person();

  Person.aaa() {
    print('aaa');
  }

  @override
  int compareTo(other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }
}
