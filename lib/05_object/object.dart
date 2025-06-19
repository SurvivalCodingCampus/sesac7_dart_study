import 'package:modu_3_dart_study/hero.dart';

void main() {
  String name = '홍길동';
  print(name);
  name.hashCode;

  Hero hero = Hero(name: '홍길동', hp: 100);
  print(hero);

  List<int> numbers = [1, 2, 3, 4];
  print(numbers);

  List<Hero> heroes = [];
  print(heroes);

  final h1 = Hero(name: '슈퍼맨', hp: 100);
  final h2 = Hero(name: '슈퍼맨', hp: 1000);

  heroes.add(h1);
  heroes.remove(h2);  // 0

  print(heroes.length);

  print(h1 == h2);  // true
  print(identical(h1, h2));   // false
}
