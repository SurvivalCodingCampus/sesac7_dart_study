## Polymorphism(다형성)
---
- ### 다양한 형태를 갖는 성질
- ### 공통 기능은 Interface로 묶어서 개발
- ### Extends하는 AbstractClass가 같다면 해당 AbstractClass를 타입으로 선언할 수 있다.
```dart
abstract class Animal {
	void eat();
}

class Human extends Animal {
	@override
	void eat() {
		...
	}
	...
}

class Dog extends Animal {
	@override
	void eat() {
		...
	}
	...
}

void main() {
	// 아래와 같이 AbstractClass의 타입으로 선언이 가능하다.
	Animal human = Human();
	Animal dog = Dog();
}
```
- ### is-a관계가 성립되면 생성할 때 Interface 타입으로 선언할 수 있다.
	- 상속 관계와 관련이 없어도 같은 Interface를 구현중이면 집합으로 만들 수 있다.
	- Interface로 선언된 인스턴스의 타입은 런타임에 결정된다.
	```dart
	abstract interface class Moveable {
		void run();
	}
	
	class Human implements Moveable {
		@override
		void run() {
			...
		}
	}
	
	class Dog implements Moveable {
		@override
		void run() {
			...
		}
	}
	
	void main() {
		// 아래와 같이 Inteface 타입으로 선언이 가능하다.
		Moveable human = Human();
		Moveable dog = Dog();
	}
	```
	- Interface Type으로 선언된 인스턴스는 'is' keyword로 타입 체크가 가능하다.
	```dart
	abstract interface class Moveable {
		void run();
	}
	
	class Human implements Moveable {
		@override
		void run() {
			...
		}
		void talk() {
			...
		}
	}
	
	void main() {
		Moveable human = Human();
		if(human is Human) {
			human.talk(); // Dart는 스마트 캐스팅이 가능하다.
		}
	}
	```
- ### 타입 캐스트가 가능하다.
	- 'as' keyword를 사용해서 타입을 변환한다.
	- 위험성이 있기 때문에 is를 통해 타입 체크 후 자동으로 스마트 캐스팅 후 사용한다.
	```dart
	abstract interface class Moveable {
		void run();
	}
	
	class Human implements Moveable {
		@override
		void run() {
			...
		}
		void talk() {
			...
		}
	}
	
	void main() {
		Moveable human = Human();
		Human humanType = human as Human; // 위험성이 있음
		if(human is Human) { // is로 타입 체크해서 스마트 캐스팅하는 것이 안전
			...
		}
	}
	```
- ### Dart는 메서드 overrloading을 지원하지 않는다.
	- 인자로 구체화된 객체 대신 추상 클래스나 인터페이스를 받는다.