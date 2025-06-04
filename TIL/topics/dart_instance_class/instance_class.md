# 오브젝트, 인스턴스, 클래스

## 오브젝트를 도출하는 순서

1. 오브젝트가 가지고 있을만한 **속성**이나 **동작**을 생각해 종류와 내용을 정의한다
2. 오브젝트를 가상 세계에 도출, 동작시켜 보기

## 오브젝트 (object)

- 현실 세계의 모든 객체

## 클래스 (class)

- 오브젝트를 가상 세계 용으로 구체화 한 것 (붕어빵 틀)

## 인스턴스 (instance)

- 클래스를 활용 해 메모리 상에 만들어 낸 것 (붕어빵)

## Dart에서 클래스 구현

```dart
class Hero {
	String name;
	int hp;
	final int level = 10;
	
	Hero(this.name, this.hp);
	
	void attack() {}
	
	void run() {}
	
	void sleep() {}	
}
```

- 필드(field)를 상수로서 선언 가능하다

## 함수와 메소드

### 함수

- 단독으로 동작한다
- 입력이 같으면 결과도 동일하다

```dart
// 최상위 함수
bool isEven(int number) {
	return number % 2 == 0;
}
```

### 메소드

- 클래스 내부에 존재하는 클래스의 기능이다
- 입력된 속성이 같아도 속성의 값에 따라 결과가 다르다

```dart
class MyClass {
	// 필드 및 생성자
	...
	
	// 메소드
	bool isEven(int number) {
			return number % 2 == 0;
	}
}

void main() {
	MyClass myClass = MyClass();
	
	// 메소드 사용
	myClass.isEven(3);	
}
```

### 클래스 정의에 따른 효과

- 정의한 클래스로 **인스턴스를 생성** 할 수 있다
- 이 클래스로 생성한 인스턴스를 넣을 수 있는 **새로운 변수의 타입이 이용 가능**해 진다
- 예시 : Hero 클래스를 정의하면 Hero 타입의 변수가 이용 가능하다

```dart
Hero hero = Hero('hero', 100);
```

- 변수가 많아질수록 기능이 많아질수록 처리하기 복잡해진다
- **클래스를 정의하면 이용 가능한 타입의 종류가 점점 늘어 난다** ( 사용하기 편하게 하기 위해서 )
##

# 정리

## 인스턴스와 클래스

- 인스턴스와 클래스는 완전히 다른 것이다. 혼동 하지 말자
- 가상 세계에서 활동하는 것은 인스턴스  (오브젝트)
- 인스턴스를 생성하기 위한 틀이 클래스

### 필드와 메소드

- 클래스에는 속성을 필드로, 동작을 메소드로 선언한다
- final이 붙은 필드는 상수 필드로서 값이 불변이다
- **클래스의 상수 필드는 const는 사용이 불가능하다**
    - **언제 인스턴스화해서 사용할지 모르는데 컴파일 타임에 상수를 메모리에 올린다는 건 말이 안 된다**

### 클래스 타입

- 클래스를 정의하면, 그 클래스 타입의 변수를 선언 할 수 있다
- 어떤 클래스 타입 변수는 그 클래스의 인스턴스를 담을 수 있다

### 인스턴스화

- new 키워드를 사용하여 클래스로부터 인스턴스를 생성한다 ( dart는 new 생략 가능 )
- 어떤 클래스 타입 변수에 인스턴스가 담겨 있을 때 “변수명.필드명”, “변수명.메소드명()” 으로 그 인스턴스의 필드나 메소드를 이용할 수 있다

```dart
class Hero {
	String name;
	int hp;
	
	Hero(this.name, this.hp);
	
	void attack() {}
	
	// 그 외 메소드들
	...
}

void main() {
	Hero hero = Hero('용사', 100);
	
	print(hero.name);
	print(hero.hp);
	hero.attack();	
}
```

### 클래스와 멤버변수의 네이밍 컨벤션
<table>
  <tr>
    <td>클래스명</td><td>명사</td><td>단어의 맨 처음은 대문자 (pascal)</td><td>Hero, MonsterInfo</td>
  </tr>
  <tr>
    <td>변수명</td><td>명사</td><td>최초 이외의 단어의 맨 처음은 대문자 (camel)</td><td>level, items, itemList</td>
  </tr>
  <tr>
    <td>메소드명</td><td>동사</td><td>최초 이외의 단어의 맨 처음은 대문자 (camel)</td><td>attack, findWeakPoint</td>
  </tr>
</table>

### 생각해보기
Q. 클래스는 왜 만드는가?

Q. 클래스의 필드를 상수로 선언할 때 왜 final만 가능한가?