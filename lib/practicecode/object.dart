class Hero {
  String name;
  int power;

  Hero({required String name, required int power}) : name = '', power = 0;
}

void main() {
  final heros = <Hero>{};

  final h1 = Hero(name: '슈퍼맨', power: 100);
  final h2 = Hero(name: '슈퍼맨', power: 100);

  heros.add(h1);
  heros.remove(h2);

  print(heros.length);
}
