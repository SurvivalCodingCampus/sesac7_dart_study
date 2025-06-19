# Polymorphism (다형성)
- 현실 세계를 반영해 하나의 타입이 여러 곳에 속할 수 있게 만들어줌
- 하나의 타입이 여러 기능을 수행할 수 있게 함


```dart
abstract class Monster {
  void run() {
    print('monster run');
  }
}

class Slime extends Monster {
  @override
  void run() {
    print('slime run');
  }
}

void main() {
  Slime slime = Slime();
  Monster monster = Slime();

  slime.run(); // slime run
  // Slime에서 override 했기 때문에 Slime의 run으로 출력됨
  monster.run(); // slime run
}
```

### as 타입 캐스팅 위험
- 휴먼 에러 발생 쉬움
```dart
abstract interface class Drawable {
  void draw();
}

class Dog implements Drawable {
  @override
  void draw() {
    print('Dog');
  }

  void run() {
    print('Run');
  }
}

class House implements Drawable {
  @override
  void draw() {
    print('House');
  }
}

void main() {
  final elements = <Drawable>[
    Dog(),
    House(),
  ];

  for (final element in elements) {
    element.draw();
    // Dog
    // House
  }

  // 컴파일 타임엔 문제 없지만 런타임에서 터짐
  // for (final element in elements) {
  //   final dog = element as Dog;
  //   dog.run();
  // }

  // is 로 타입 체크 후 사용하는 것이 안전
  for (final element in elements) {
    if (element is Dog) {
      element.run(); // run
    }
  }
}
```