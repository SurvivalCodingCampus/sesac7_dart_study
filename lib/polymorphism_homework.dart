abstract class X {
  void a();
}

abstract class Y extends X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {
  Y ex1 = A();
  Y ex2 = B();
  final List<Y> exList = [];

  exList.add(ex1);
  exList.add(ex2);

  exList[0].b();
  exList[1].b();
}
