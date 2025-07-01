class Hero {
  String name;
  int age;

  Hero(this.name, this.age);

  void run() {
    print('뛴다');
  }
}

class SuperHero extends Hero {
  SuperHero(super.name, super.age);

  @override
  void run() {
    print('Fly');
  }
}

void main(){
  final h = Hero('sd', 100);
  final s = SuperHero('name', 1);
  h.run();
  s.run();
}