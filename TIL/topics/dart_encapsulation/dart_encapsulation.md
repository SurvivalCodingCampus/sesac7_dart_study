# Dart 캡슐화
## 객체 지향 3가지 속성

- 캡슐화
- 상속
- 다형성

## 캡슐화

- 속성을 덮어 쓰거나, 잘못된 조작 하는 등의 휴먼 에러 (human error)를 방지하기 위한 방법이다

```dart
// 캡슐화를 하지 않은 예시
class Hero {
	String name;
	int hp;
	
	// 생성자 생략
	
	void bye() {
		print('빠이');
	}
	
	void die() {
		print('죽었다');
	}
}

class King {
	// 필드 생략
	
	final hero = Hero('용사', 100);
	
	// 잘못된 접근 문제가 발생
	hero.die();
}
```

## 멤버에 대한 엑세스 제어

- 접근 지정자 (access modifier)

| 제한 범위 | 명칭 | 설정 방법 | 접근 가능한 범위 |
| --- | --- | --- | --- |
| 제한이 엄격 | private | 멤버 앞에 _ (언더바) 붙이기 | 자기 자신의 클래스 |
| 제한이 느슨 | public | 기본 값 | 모든 클래스 |

```dart
class Hero {
	String name;
	int _hp;   // private
	
	Hero({required this.name, requiared int hp}) : _hp = hp;   // initializar list 기법
	
	// 메소드를 private로 지정
	void _die() {
		print('죽었다');
	}
}
```

## getter 와 setter

- 메소드를 경유한 필드 조작
- **getter** : 읽기 전용 프로퍼티를 구현할 때 사용
- **setter** : 쓰기 전용 프로퍼티를 구현할 때 사용 (잘 안 씀)

```dart
class Hero {
	String name;
	int _hp;
	
	// getter
	int get hp => _hp;
	
	Hero({required this.name, requiared int hp}) : _hp = hp;
	// 생성자 뒷 부분( : _hp = hp) initializar list 기법
	
	// setter
	set hp(int value) {
		// 유효성 검사
		if (value < 0) {
			throw Exception('hp는 음수일 수 없다');
		}
		_age = value;
	}
}
```

- getter는 외부에서 상수처럼 보이지만, 메서드와 비슷하다
- setter를 사용할 때 유효성 검사에서 조건에 맞지 않다면 예외 (Exception) 처리하자

### getter / setter 의 메리트

1. Read Only, Write Only 필드의 구현
2. 필드의 이름 등, 클래스의 내부 설계를 자유롭게 변경 가능
3. 필드로의 액세스를 검사 가능

### 특정 테스트가 예외가 발생되어야 하는 것을 테스트

```dart
// 예외가 발생하거나 아닌 경우 테스
expect(() => a.transfer(b, 600), throwsException);
expect(() => a.transfer(b, 600), returnsNormally);
```

## 클래스에 대한 엑세스 제어

- 함수, 변수와 동일한 규칙을 가짐

```dart
class A {}

class _B {}
```

## 캡슐화에 대한 생각

- 개발자의 잘못된 접근에 대한 제어 방법을 제공
- 현실세계와 동일하게 프로그래밍 하려는 제어 방법
- 결국은 휴먼 에러를 줄이기 위해서다

## 정리

### 캡슐화의 개요

- 캡슐화를 하여 멤버나 클래스로의 접근을 제어할 수 있음
- 특히, 필드에 “현실 세계에서 불가능한 값”이 들어가지 않도록 제어

### 멤버에 대한 접근 지정

- private 멤버는 동일 파일 내에서만 접근 가능
- public 멤버는 모든 클래스에서 접근 가능

### 클래스에 대한 접근 지정

- 함수, 변수와 동일한 규칙

### 프로퍼티 (property)

- getter / setter 메서드를 캡슐화하여 필드처럼 직접 접근할 수 있도록 하는 문법적 요