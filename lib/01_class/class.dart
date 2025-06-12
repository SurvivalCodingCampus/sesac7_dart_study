import '../hero.dart';

void main() {
  print(Hero.money);
  print(heroMoney);


  final hero1 = Hero('홍길동', hp: 100);
  final hero2 = hero1;
  // hero2.hp = 200;

  // print(hero1.hp);

  hero1.attack();

  Person person = Person('aaa');


}

class Person {
  String name;

  Person(this.name);
}