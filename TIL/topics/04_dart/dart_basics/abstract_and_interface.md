# 추상

## 추상 클래스와 추상 메소드
- abstract 사용
- 추상 클래스는 인스턴스화 금지
- 내용이 정의되지 않고 상세정의 미정인 메소드가 있는 클래스는 abstract를 붙여서 추상 메소드로 한다
- 일부라도 미정인 것이 있다면 추상

```dart
abstract class Character{
}
```

## 추상클래스와 인터페이스의 구분 사용
- 추상 클래스는 상속할때만 사용
- 인터페이스는 구현할때만 사용: implements

## 인터페이스(interface)
- 추상메서드만 가지는 추상클래스
- 필드를 가지지 않는다
- 모든 메소드는 추상 메소드여야 한다
```dart
abstract interface class Human{
    void speak();
}
```

## 인터페이스의 효과
- 같은 인터페이스를 구현한 클래스들은 공통 메서드를 구현하고 있음을 보장
- 어떤 클래스가 인터페이스를 구현하고 있다면 적어도 그 인터페이스에 정의된 메소드를 가지고 있다는 것이 보증된다

```dart
// extends 와 implements 를 동시에 사용
class Wizard extends Hero implements Attackable, Healable {}
```
