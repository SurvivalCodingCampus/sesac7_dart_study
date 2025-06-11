void main() {
  A a = A();
  B b = B(0);

  print(a.money);
  print(b.money);
}

class A {
  int? energy;
  int money;

  A({this.energy, this.money = 0});
}

class B {
  int? energy;
  int money;

  B(this.energy, {this.money = 0});
}
