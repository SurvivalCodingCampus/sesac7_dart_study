# 다형성
- 어떤것을 이렇게도 저렇게도 부를 수 있는 것
- 공통 메소드를 통합
```dart
house.draw();
dog.draw();
car.draw();
```

## interface 정의
```dart
abstract interface class Drawalbe{}
```

## 다형성 활용 방법
- 추상적인 선언 = 상세 정의로 인스턴스 화
```dart
  Character character = Hero('홍길동', 100);
```

## 예시
```dart
final Drawable d = elements[i];
d.draw();
```
- Drawable 은 인터페이스 또는 추상 클래스
- 타입을 가지는 요소들 리스트 중 i 번째 요소를 d 가 담고있고 
- 실제 타입은 elements 안에 있는 house, dog, tree 중 실제 타입은 런타임에 결정됨
- 실체 구현체 d의 draw 메서드를 호출하고 있다

## switch 문으로 타입 체크 가능
```dart
final Drawable d = elements[i];

switch (d) {
  case House();
    print('집 선택');
    break;
  case Dog();
    print('개 선택');
    break;
  case Tree();
    print('나무 선택');
    break;
}

d.draw(); // 다형성: 실제 타입의 draw 메서드 호출
```

### 인터페이스 vs 추상클래스
1. 인터페이스: 뭘 할 수 있는지 정의
- 상속불가, 구현만 가능
- 다중 구현 가능

2. 추상 클래스: 공통 로직, 뭘 할 수있는지 정의
- 상속, 구현 가능
- 다중 상속 불가


## 스마트 캐스팅 (Smart Cast) - `is` 키워드

- 스마트 캐스팅은 `is` 키워드를 사용해 **타입을 검사한 뒤** 해당 타입이 맞을 경우 안전하게 해당 타입의 멤버에 접근할 수 있도록 함

```dart
void main(List<String> arguments) {
  Character character = Wizard('name', 10);

  if (character is Hero) {
    Hero hero = character; // 타입 확인 후
    // hero 객체를 사용
  }
}
```

## as 강제 타입 캐스팅
- 강제로 타입 캐스팅 하지 않는다
- 런타임 에러, 휴먼에러 발생 높음
```dart
void main(List<String> arguments) {
  // Monster 타입으로 선언되어 있지만, 실제로는 Slime 인스턴스
  Monster monster = Slime('B');

  // 강제 캐스팅 (as 사용)
  Slime slime = monster as Slime;

  // Slime 클래스의 기능 사용 가능
  slime.run();
}
```