import '../hero.dart';

void main() {
  Set<Hero> heroes = {};
  print(heroes);

  final h1 = Hero(name: '슈퍼맨', hp: 100);
  final h2 = Hero(name: '슈퍼맨', hp: 100);

  heroes.add(h1);
  heroes.remove(h2);  // 0

  print(heroes.length);

  print(h1 == h2);  // true
  print(identical(h1, h2));   // false

  print(h1.hashCode);
  print(h2.hashCode);

  print('홍길동'.hashCode);
  print('홍길동'.hashCode);
}