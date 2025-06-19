# 다형성

## 스마트 캐스팅 (Smart Cast) - `is` 키워드

- 스마트 캐스팅은 `is` 키워드를 사용해 **타입을 검사한 뒤** 해당 타입이 맞을 경우 안전하게 해당 타입의 멤버에 접근할 수 있도록 함

```dart
void main(List<String> arguments) {
  Character character = Wizard('name', 10);

  if (character is Hero) {
    Hero hero = character; // 타입 확인 후 안전하게 다운캐스팅 가능
    // hero 객체를 사용 가능
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