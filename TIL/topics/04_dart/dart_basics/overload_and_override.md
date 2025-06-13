# overloading
- Dart에서 같은 이름의 함수나 생성자를 파라미터만 다르게 해서 여러개 정의하는 것은 불가

# override
- 기존 기능을 재정의
- 부모 클래스에 있는 메소드를 자식 클래스에서 재작성 할 경우, 오버라이드 라고 함

```dart
// 클래스 명 pascal
class Hero{
  void run(){
    print('$name 이 도망쳤다');
  }
}

// Hero 에서 상속받은 SuperHero
class SuperHero extends Hero{
  SuperHero({required super.name, required super.hp});

  @override // @: 주석
  void run(){
    print('$name 이 퇴각했다');
  }
}

```
