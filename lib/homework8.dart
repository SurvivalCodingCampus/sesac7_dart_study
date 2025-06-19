abstract interface class X {
  void a();
}

abstract class Y implements X {
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
  //연습문제 2
  X obj = A();
  obj.a();
  // obj.b();
  // obj.c();

  Y y1 = A();
  Y y2 = B();
  y1.a();
  y2.a();

  //연습문제 3
  final list = <Y>[];
  list.add(y1);
  list.add(y2);

  for (var element in list) {
    element.b();
  }
}
