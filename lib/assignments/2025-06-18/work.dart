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
  // X obj = A();
  // obj.a();
  /// 연습문제 1번. a()만 가능/ 왜? 컴파일러는 obj를 X타입이라고 생각하기때문에 X에 존재하는 a()만 가능하다.

  ///연습문제 2번. 실행하면 y1.a는 A클래스 타입이기 때문에 A클래스의 a() 와 y2는 B클래스의 a()실행되어. Aa/Ba가 나온다.
  Y y1 = A();
  Y y2 = B();

  y1.a(); //Aa   A클래스의 a();
  y2.a(); //Ba   B클래스의 a();

  ///연습문제 3번
  ///List의 타입은 Y가 되어야한다. X로 하면 컴파일러가 X클래스의 b()메소드를 찾는데, 없다.
  ///Y클래스에는ㄴ b()가 존재하여, 컴파일러가 있다고 판단하고, 실행하면, 각 A,B클래스의 b()메소드를 실행한다.
  ///예상 결과값은 Ab,Bb이다.

  List<Y> list = [
    y1,
    y2,
  ];
  for (final item in list) {
    item.b();
  }
  //Ab,Bb.
}
