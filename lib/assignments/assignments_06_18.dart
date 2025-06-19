/*
연습문제1
(1) Item
(2) Monster

연습문제2
1. a()
2. Aa, Ba
*/

// 연습문제3
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
  final list = <Y>[
    A(),
    B(),
  ];

  for (final element in list) {
    element.b();
  }
}
