import 'package:modu_3_dart_study/hero.dart';

class Address {}

class Person {
  Address address;

  Person(this.address);

  Person copyWith({Address? address}) {
    return Person(
      address ?? this.address,
    );
  }
}

void main() {
  int i = 10;
  int i2 = i;

  i2++;

  print(i); // 10
  print(i2); // 11

  Hero hero1 = Hero(name: '홍길동', hp: 100);
  // Hero hero2 = Hero(name: hero1.name, hp: hero1.hp);
  Hero hero2 = hero1.copyWith(name: '김삿갓');
  hero2.hp = 200;

  print(hero1);
  print(hero2);


  Person person1 = Person(Address());
  Person person2 = person1.copyWith();

  print(person1.hashCode);
  print(person2.hashCode);

  print(person1.address.hashCode);
  print(person2.address.hashCode);
}
