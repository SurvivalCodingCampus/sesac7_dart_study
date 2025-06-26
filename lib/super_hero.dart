import 'hero.dart';

class SuperHero extends Hero {
  int mp;

  SuperHero({
    required super.name,
    required super.hp,
    required this.mp,
  });

  @override
  void run() {
    print('SuperHero 의 run');
  }
}

void main() {
  Hero hero = Hero(name: '_name', hp: 100);
  hero.run();

  SuperHero superHero = SuperHero(name: 'name', hp: 100, mp: 10);
  superHero.run();
}
