# 제네릭 (Generic), 열거형 (enum)
### 타입이 없을 때의 문제점

- 런타임 에러가 나기 쉽다
- IDE가 컴파일 에러를 미리 찾을 수 없다

## 제네릭 (Generic)

- 타입을 나중에 원하는 형태로 정의할 수 있다
- 타입 안전 (type safe) 효과
- 타입이 클래스, 인터페이스인 경우만 사용가능하다
- Dart애서는 int가 클래스이지만, Java에서는 Integer가 가능하다

```dart
List<E> class
Map<K, V> class
```

- 내가 원하는 타입만 들어가게 지정할 수 있다

```dart
class Poket<E> {
	E? _data;
	
	void put(E data) {
		_data = data;
	}
	
	E? get() {
		return _data;
	}
}
```

- 이용 가능한 타입에 제약을 추가할 수 있다

```dart
class Poket<E extends Book> { 생략 }
```

## 열거형 (enum)

- 정해둔 값만 넣어 둘 수 있는 타입

- 상태를 정의하는 값으로 사용 가능하다

```dart
class AuthState {
	static const authenticated = 1;
	static const unauthenticated = 2;
	static const unknown = 3;
}
==================================
int authState = AuthState.unknown;

if (authState == AuthState.authenticated) {
	print('인증된');
} else if (authState == AuthState.unauthenticated) {
	print('미인증');
} else {
	print('알 수 없음');
}
```

- 필드의 값이 변경, 추가되거나 조건문에서 누락되는 등의 휴먼 에러를 IDE에서 확인이 불가능 하다
- 열거형 (enum) 을 사용하면 switch문과 함께 사용해서 위의 문제를 해결할 수 있다
- enum 에서 변화가 생기면 switch문에도 즉각 반영된다 (IDE가 문제를 바로 알아차릴 수 있다)

```dart
enum AuthState {
	authenticated,
	unauthenticated,
	unknown,
}
=======================================
AuthState authState = AuthState.unknown;

switch (authState) {
	case AuthState.authenticated:
		print('authenticated');
	case AuthState.unauthenticated:
		print('unauthenticated');
	case AuthState.unknown:
		print('unknown');
}
```