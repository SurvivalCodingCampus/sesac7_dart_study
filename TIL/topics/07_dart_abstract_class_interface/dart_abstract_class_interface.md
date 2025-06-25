# Dart 추상 클래스 & 인터페이스

## 추상 클래스 (abstract class)

- 상속의 재료로 사용 되는 클래스
- 상세 부분이 일부 미정의 된 클래스

### 왜 사용하는가?

- 상세정의가 미정인 메소드를 가진 상속의 재료로 사용될 클래스를 구분하려고 사용한다
- 추상 클래스가 아닌 일반 클래스인채로 두면 미완성인 클래스를 인스턴스화 하는 문제가 발생한다
- 추상 클래스는 인스턴스화가 금지되어 있다
- 상속의 재료로 사용될 때 오버라이드를 강제할 수 있다

```dart
abstract class Character {
	String name;
	int hp;
	
	Character(this.name, this.hp);
	
	void run() {
		print('$name이 도암쳤다.');
	}
	
	// 추상 메소드
	void attack(Slime slime);
}
```

```dart
class Hero extends Character {
	int mp;

	Hero(super.name, super.hp, this.mp);
	
	@override
	void attack(Slime slime) {
		print('슬라임을 공격했다');
	}
}
```

## 인터페이스

- 모든 메소드는 추상 메소드여야 한다
- 필드를 가지지 않는다

### 추상 메소드만 가지는 추상 클래스 == 인터페이스

```dart
// 전투 가능한
abstract interface class Attackable {
	void attack(Slime target);
	void defend();
}
// 치유 가능한
abstract interface class Healable {
	void heal(Hero target);
}
```

### 인터페이스의 구현 (implements)

```dart
class Hero implements Attackable {
	final String name;
	int hp = 100;
	
	Hero(this.name);
	
	@override
	void attack(Slime target) {
		print('$name의 물리 공격');
		target.hp -= 10;
		print('${target.name}에게 10의 데미지! (남은 HP: ${target.hp}');
	}
}
```

### 인터페이스의 효과

- 같은 인터페이스를 구현한 클래스들은 공통 메소드를 구현하고 있음을 보장한다
- 어떤 클래스가 인터페이스를 구현하고 있다면, 적어도 그 인터페이스에 정의된 메소드를 가지고 있다는 것이 보증된다

### 인터페이스는 여러 인터페이스를 구현할 수 있다

```dart
class Hero implements Attackable, Movable {
	final String name;
	int hp = 100;
	
	Hero(this.name);
	
	// Attackable과 Movable의 메소드 구현은 이곳에 추가해야 합니다
}
```

### extends와 implements를 동시에 사용 가능하다

```dart
class Hero extends Character implements Attackable {
	// 생략
}
```

## 정리

### 상속의 재료를 작성하는 개발자의 입장과 역할

- **다른 사람이 상속의 재료로 사용할 부모 클래스를 만드는 입장**의 개발자도 존재한다
- 미래의 개발자가 효율 좋게 안심하고 이용할 수 있는 상속의 재료를 작성하는 것이 그의 사명이다\

### 추상 클래스

- 내용이 정의되지 않고 상세정의 미정인 메소드가 있는 클래스는 abstract를 붙여서 추상 메소드로 한다
- 추상 클래스는 인스턴스화 할 수 없다
- 추상 클래스와 추상 메소드를 활용한 상속의 재료로서의 부모 클래스를 개발하면, 예기치 않은 인스턴스화나 오버라이드의 미 구현의 걱정이 없다

### 인터페이스

- 추상 클래스 중에 기본적으로 추상 메소드만 가지고 있는 것을 인터페이스로서 특별 취급 한다
- 복수의 인터페이스를 부모로 두는 다중상속 효과가 가능 (하지만 이걸 다중 상속이라고 부르지 않는다)
- 인터페이스를 구현(implementation)한다고 한다
- interface 키워드는 Dart 3.0에 추가되었