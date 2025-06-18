# Interface
기능의 명세
- 인터페이스가 제공하는 기능 구현 보장(implements 시 구현 필수)
- 여러 인터페이스 구현(implements) 가능
```dart
// 이전 버전과 호환성을 위해 중간에 키워드 추가하는 형식
// interface 키워드가 3.0에 생김
// 이전에는 abstract class를 인터페이스처럼 사용함(그래서 implements 가능;)
abstract interface class Movable {
  void move();
}

class SomeClass implements Movable {
  @override
  void move() {
    // something
  }
}
```

# abstract class
요구사항의 명세
- 값, 기능 가질 수 있음
- abstract class 내에서 구현은 안 해도 됨
- 상속(extends)받아 구현해야 함
```dart
abstract class SomeAbstract {
  String name;

  SomeAbstract(this.name);

  void someFunction();
}

class SomeClass extends SomeAbstract {
  int number;

  SomeClass(super.name, {required this.number});

  @override
  void someFunction() {
    // something
  }
}
```