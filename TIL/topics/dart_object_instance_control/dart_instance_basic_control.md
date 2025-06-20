# 인스턴스 기본 조작

## 모든 클래스는 Object를 상속받는다

### Object가 갖고 있는 애들

- toString()
- hashCode

### toString()

- 객체의 정보를 문자열로 출력할 때 사용한다
- 나만을 위해서 오버라이딩이 가능하다

## Dart에서는 == (equals) 자체를 재정의 할 수 있다 (오버라이드 가능)

```dart
bool operator ==(Object other) {
	if (otheris Hero) {
		return name == other.name;
	}
	return false;
}

int get hashCode => name.hashCode;

identical(a, b);   // true, false
```

### ==: 객체가 정의한 동등성 비교

### hashcode 비교 (해시 알고리즘을 통한 랜덤값 부여)

- hashcode는 객체의 내용이 같은지 추가로 확인하는데 사용된다

### identical(a, b): 참조 비교 (메모리 비교)

## 컬렉션 (collection) 동등성 비교

- List 안에서는 동등성 비교를 == 을 기준으로 한다 (재정의 하면 그 기준을 따름)
- Set, Map 안에서는 hashcode를 동등성 비교 기준으로 한다
- 스트링은 스트링풀에서 같은 문자를 재활용한다 (같은 문자들의 해시코드를 비교하면 같게 나온다)

### List가 검색이 느린이유

- 순차 검색으로 동등성을 검사하기 때문
- Set, Map은 해시코드를 기반으로

## 객체지향 프로그램에서는 객체는 반드시 해시값을 갖는다

- 같은 내용인 객체끼리는 같은 hashCode를 갖지만
- 같은 hashCode라 해서 같은 객체인 것은 아니다 (확률 매우 희박)

## 정렬

## 주의

- Dart의 sort는 원본을 직접적으로 정렬하기 때문에 라이브러리를 통해서 sorted를 사용하자
- 원본을 건들지 않도록 하자

### Comparable

- 클래스 간의 정렬은 Comparable 인터페이스를 구현해서 규칙을 정의해야한다
- 하지만 클래스 내부를 수정하는 것보다는 외부에서 인스턴스들의 특정 필드 값을 기준으로 정렬하자

## Dart에서의 객체 복사

- 클래스 내부에 copyWith()를 정의하자

```dart
class Hero {
	// copyWith() 빼고 생략
	Hero copyWith({
		String? name,
		int? hp,
	}) {
		return Person(
			name: name ?? this.name,
			hp: hp ?? this.hp.
		);
	}
}
```

### 얕은 복사, 깊은 복사

- 얕은 복사는 객체의 내용만 복사한다. (참조가 같을 수 있다)
- 깊은 복사는 객체의 내용뿐 아니라 참조도 다르다 (내용만 같은 완전히 새로운 객체를 만든다)
- 만약 복사를 할 때 객체 안에 객체가 있다면 안에 있는 객체도 클래스에서 copyWith()를 정의해야한다
- 그렇지 않으면 안에 있는 객체를 기존 객체와 같이 참조 하게 된다 (참조는 그대로라서)

### 얕은 복사

```dart
class Address {
	String street;
	
	Address(this.street);
}

class Person {
	final String name;
	final Address address;
	
	Person(this.name, this.address);
	
	// 얕은 복사 메소드
	Person shallowCopy() => Person(name, address);  // 주소 객체는 같은 참조
}
```

### 깊은 복사

```dart
class Address {
	String street;
	
	Address(this.street);
	
	// 깊은 복사 메서드
	Address deepCopy() => Address(street);
}

class Person {
	final String name;
	final Address address;
	
	Person(this.name, this.address);
	
	// 얕은 복사 메소드
	Person shallowCopy() => Person(name, address);  // 주소 객체는 같은 참조
}
```

## 결론

### 객체의 동등성 비교 규칙을 위해 다음 메서드를 재정의 해 준다

- == : equals
- hashCode

### 객체의 내용을 알기 쉽게 보여주기 위해 다음 메서드를 재정의 해 준다

- toString()

얕은 복사를 지원하기 위해 다음 메서드를 작성한다

- copyWith()