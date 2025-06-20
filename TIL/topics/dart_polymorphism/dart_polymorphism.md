# 다형성

### 객체 지향은 현실 세계에 맞춰 가는 것이다

# 다형성 (polymorphism, 多形性)

- 어떤 것을 이렇게도 부르고 저렇게도 부르는 것이다

## 왜 필요한가?

- 공통 메소드를 통합해서 사용하거나 그룹핑을 하기 위해서 필요하다

## interface 정의

```dart
abstract interface class Drawable {
	void draw();
}
```

## interface 구현

```dart
class House implements Drawable {
	@override
	void draw() {
		print(```
				@ 집을 그립니다
			@	@ @
		 @	@  @
		@@@@@@@@@ 
		```);
	}
}
```

## Class를 interface로 선언

- 단일 Drawable 요소 생성

```dart
final Drawable element = House(
	address: '서울시 강남구',
	size: 100,
	color: Color.white
);
```

- Drawable 목록 생성

```dart
final List<Drawable> elements = <Drawable>[
	Dog(name: '멍멍이', age: 3),
	House(address: '서울시 강남구'),
	Tree(height: 5.0)
];
```

```dart
// Drawable = Rectangle
final Drawable drawable = Rectangle(
	width: 100,
	height: 50;
	color: Color.blue,
	borderStyle: BorderStyle.dashed
);
```

## Polymorphism (다형성)

```dart
final Drawable d = elements[i];
d.draw();
```

- 실제 타입은 런타임에 결정된다
- 하지만 컴파일러에서는 d를 Drawable로 취급한다
- 실제 구현체의 draw() 메서드가 호출된다
- 만약 d 안에 다른 메서드가 있더라도 호출이 불가능하다 (컴파일러 기준에서 메서드는 draw() 뿐이다)

### switch 문으로 타입 체크 가능

```dart
final Drawable d = elements[i];

switch (drawable) {
	case Rectangle():
		print('사각형이 선택됨');
		break;
	case House():
		print('집이 선택됨');
		break;
	case Dog():
		print('강아지가 선택됨');
		break;
}

drawable.draw(); // 다형성: 실제 타입의 draw() 메서드 호출
```

- 다형성: 실제 타입의 draw() 메서드 호출

### 다형성을 활용하는 방법

- 선언을 상위 개념으로 인스턴스 생성은 하위 개념으로 한다

```dart
abstract class Character {
	void attack();
}

class Wizard extends Character {
	@override
	void attack() {}
	
	void fireball() {}
}

void main() {
	Wizard wizard = Wizard('마법사', 50);
	Character character = wizard;
	Slime slime = Slime('A');
	
	wizard.attack(slime);
	wizard.fireball(slime);
	
	character.attack(slime); // 컴파일러는 character의 attack()만 알고있다 
	character.fireball(slime); // 컴파일러 에러
}
```

- **추상적인 선언 = 상세 정의로 인스턴스화**

```dart
Charactoer character = Hero('홍길동', 100);
```

- is-a가 성립해야한다

### 인터페이스를 변수의 타입으로 사용 가능하다

- 속하는 걸 만들려고 하는 게 인터페이스다

```dart
abstract interface class Human {
	void speak();
}

void main() {
	Human human = Dancer('name', 100);
}
```

### 타입 변경 방법 (cast)

```dart
Monster monster = Slime('B');
Slime slime = monster as Slime;
```

- 캐스트 실패 (is-a 성립 안함)

```dart
Character character = Wizard('name', 10);
Hero hero = character as Hero;
```

- 마법사는 캐릭터이며 영웅이지만, 영웅과 캐릭터는 관계가 없다

### 인스턴스의 타입 체크와 스마트 타입 캐스트

```dart
Character character = Wizard('name', 10);
if (character is Hero) {
	Hero hero = character;
}
```

- 실행 후 타입 체크를 통해서 스마트 타입 캐스트가 가능하다

### 주의

- 컴파일러에서는 추상적인 상위 클래스로 선언하면 실체화 해도 사용 못하는 기능이 생긴다
- dynamic을 사용하면 컴파일러에게 “나를 믿어라” ⇒ 휴먼 에러
- 타입 캐스트 as를 사용하면 터질 위험이 높다
- 스마트 타입 캐스팅을 활용하자

### 코드의 중복 제거에 유용하다 (다형성의 메리트 : 동일한 타입으로 취급)

```dart
final h1 = Hero('슈퍼맨', 100);
final h2 = Hero('배트맨', 100);
final h3 = Wizard('해리포터', 100);
final h4 = Wizard('헤르미온느', 100);

// 다형성 활용 못 한 코드
h1.hp = h1.hp + 50;
h2.hp = h2.hp + 50;
h3.hp = h3.hp + 50;
h4.hp = h4.hp + 50;

final characters = <Character>[];
characters.add(h1); // characters.add(Hero('슈퍼맨', 100));
characters.add(h2);
characters.add(h3);
characters.add(h4);

// 코드의 중복 제거
characters.forEach((character) {
	character.hp += 50;
});
```

### Dart는 메소드 오버로딩을 지원하지 않는다

### 인자를 받을 때도 구체화된 객체 대신 추상 클래스나 인터페이스를 이자로 받는다

```dart
class Hero extends Character {
	Hero(super.name, super.hp);
	
	@override
	void attack(Monster monster) {}
}
```

### 타입을 하나로 묶고, 잘 동작하게 하기

```dart
final monsters = <Monster>[]; // 빈 리스트 생성
monsters.add(Slime('A'); // run() 재정의
monsters.add(Goblin());  // run() 재정의

// 동작은 안에 담긴 객체를 따름
monsters.forEach((monster) {
	monster.run();
});
```

## 정리

### 인스턴스를 애매하게 퉁치기

- 상속에 의한 is-a 관계가 성립한다면, 인스턴스를 부모 클래스 타입의 변수에 대입할 수 있다
- 부모 클래스 타입 변수에 대입하는 것으로, 퉁 칠 수 있다

### **상자의 타입** 과 **내용의 타입** 의 역할

- 어떤 멤버를 이용할 수 있는가는 상자의 타입이 결정한다
- 멤버가 어떻게 움직이는지는 내용의 타입이 결정한다

### 취급 변경

- as 키워드를 사용하여 타입 캐스팅을 수행한다
- is 키워드를 사용하여 타입을 검사할 수 있다

### 다형성

- 같은 부모를 가지는 다른 인스턴스를 동일시하여, 부모 클래스 타입의 에 담을 수 있다
- 마찬가지로, 부모 클래스 타입의 인수나 리턴 값을 이용하여, 다른 클래스를 모아서 처리 가능
- 동일시 취급 해도, 각각의 인스턴스는 각 클래스의 정의를 따르고 다른 동작을 한다

## 연습 문제 2

```dart
X obj = A();

// obj가 호출할 수 있는 메소드는 인터페이스 X void a(); 뿐 이다
obj.a();
```

```dart
void main() {
  Y y1 = A();
  Y y2 = B();

  y1.a();
  y2.a();
}
// 결과
// Aa
// Ba
```