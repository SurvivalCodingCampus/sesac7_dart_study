# Dart 상속속

## 상속이란?

- 이미 있는 클래스에 기능을 추가해서 사용해야 할 때 상속이 필요하다

### 복사 붙여넣기의 문제점

- 추가, 수정에 시간이 걸림
- 소스의 파악이나 관리가 어려워 짐

### 해결책으로 “**상속**”을 활용

```dart
class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime {
  PoisonSlime(super.suffix);

  int _poisonCount = 5;

  int get poisonCount => _poisonCount;

  @override
  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 대미지');
    hero.hp -= 10;

    if (_poisonCount > 0) {
      int poisonDamage = (hero.hp / 5).toInt();

      print('추가로, 독 포자를 살포했다!');
      hero.hp -= poisonDamage;
      print('$poisonDamage포인트의 데미지');
      _poisonCount--;
    }
  }
}
```

- Dart는 다중 상속 금지다

## 오버로드

- 메소드가 받는 매개변수(입력)의 갯수, 타입에 따라 다른 메소드, 기능을 구현할 때를 말한다

```dart
void run(int a) {
	print(a);
}

void run(int a, int b) {
	print(a);
	print(b);
}
```

## 오버라이드

- 기존 메소드를 재정의, 입력은 같지만 다른 기능을 구현할 때를 말한다

```dart
class Slime {
	// 생략

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime {
  // 생략

  @override
  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다');
    print('10의 대미지');
    hero.hp -= 10;

    if (_poisonCount > 0) {
      int poisonDamage = (hero.hp / 5).toInt();

      print('추가로, 독 포자를 살포했다!');
      hero.hp -= poisonDamage;
      print('$poisonDamage포인트의 데미지');
      _poisonCount--;
    }
  }
}
```

## 부모 객체 참조는 super 키워드

## 슈퍼 클래스 / 서브 클래스

- Dart는 생성자가 매우 복잡하다
- 서브 클래스의 생성자는 슈퍼 클래스의 생성자를 따라간다
- 슈퍼 클래스에 있는 생성자는 서브 클래스에서도 정의해야 한다 (자동 완성 권장)
- 슈퍼 클래스의 생성자를 호출하지 않으면 에러 난다
- 하지만 슈퍼 클래스에서 정의한 생성자 파라미터 기본값은 반영되지 않는다
- 기본값이 있으면 생성자를 서브 클래스에서 정의할 때 매우 복잡해진다
- 그냥 기본값을 넣지 말자

## 올바른 상속

- **“is-a 원칙”을** 준수
- 예 : 휴대폰 is a 전자기기, 자동차 is a 교통수단
- **“is-a 원칙”을** 준수하지 않으면 **“잘못 된 상속”**이다

## 잘못된 상속을 하면 안 되는 이유

- 클래스를 확장할 때 현실세계와 모순이 생긴다
- 객체 지향의 3대 특징 중 “다형성”을 이용할 수 없게 된다

```dart
// 잘못된 상속 예시
class HealthPotion extends Weapon {
	HealthPotion() : super('체력 포션', 0); // 생성자에서 부모 클래스 초기화
}
```

- HealthPotion이 Weapon을 상속 받았다면, HealthPotion으로 싸울 수 있다
- 이렇게 하면 개념적으로 잘못된 상속이다
- 물론 의도에 따라 옳은 상속이 될 수도 있다

## 구체화와 일반화의 관계

### 자식 클래스일수록 구체화되고

### 부모 클래스(슈퍼 클래스) 일수록 추상적인 것으로 일반화된다

## 정리

### 상속의 기초

- extends를 사용하여 기초 클래스를 기초로 하는 새로운 클래스 정의가 가능하다
- 부모 클래스의 멤버는 자동적으로 자식 클래스에 상속되므로, 자식 클래스에서는 추가된 부분만 기술하면 된다
- 부모 클래스에 있는 메소드를 자식 클래스에서 재작성하는 경우를 오버라이드 한다고 한다
- 올바른 상속 : “자식 클래스 is-a 부모 클래스”
- 상속에는 “추상적, 구체적” 관계에 있다는 것을 정의하는 역할도 있다

### 상속 시에 인스턴스

- 인스턴스는 내부에 부모 클래스의 인스턴스를 가지는 다중 구조를 가진다
- 보다 외측의 인스턴스에 속하는 메소드가 우선적으로 동작한다
- 외측의 인스턴스에 속하는 메소드는 super 키워드를 사용하여 내측 인스턴스의 멤버에 접근 가능하다

### 생성자 동작

- 다중구조의 인스턴스가 생성되는데, 자동적으로 가장 외측의 인스턴스의 생성자가 호출 된다
- 모든 생성자는 “부모 인스턴스의 생성자”를 호출할 필요가 있다