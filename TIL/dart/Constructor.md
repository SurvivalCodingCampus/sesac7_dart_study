
# Constructor

인스턴스를 생성하는 함수

## Types of Constuctor

### Generative constructor
```dart
class SomeClass {
	String name;
	int number;

	SomeClass(this.name, this.number);
}
```

code block
- 런타임에 동작
```dart
class SomeClass {
	String name;
	int number;

	SomeClass(this.name, this.number) {
		// some initialization
	}
}
```

파라미터 이름 없이 사용하지만 기본값 할당 가능
```dart
class SomeClass {
  String name;
  int number;

  SomeClass(this.name, [this.number = 5]);
}
```

### Default constructor
기본으로 제공됨
- 생성자 구현 없을 경우
```dart
class SomeClass {}

void main() {
	SomeClass();
}
```

### Named constructor
```dart
const String someName = 'someName';
const int someNumber = 1;

class SomeClass {
	String name;
	int number;

	SomeClass(this.name, this.number);

	SomeClass.something() : name = someName, number = someNumber;
}
```

### Constant constructor
변하지 않는 객체를 만들 때, 컴파일 타임 상수로 만들 수 있음
- 모든 인스턴스 변수를 final로 선언
- 생성자 앞에 const 키워드
항상 상수로 만들어지는 것은 아님
- non-constant context
```dart
class SomeClass {
	final String name;
	final int number;

	const SomeClass(this.name, this.number);
}
```

### Redirecting constructor
자신의 다른 생성자를 호출
```dart
class SomeClass {
	String name;
	int number;

	SomeClass(this.name, this.number);

	SomeClass.withName(String name) : this(name, 0);
}
```

### Factory constructor
this에 접근 불가
아래 경우에 사용 가능
- 항상 새 인스턴스를 리턴하지 않는 경우
	- 캐시에서 가져올 때
	- 서브 타입의 인스턴스 생성
- 인스턴스 생성 전에 작업이 필요한 경우
    - 런타임에 특정 로직을 수행하고 인스턴스 생성
	- initializer list로 불가능한 작업

```dart
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
```

initializer list
- 컴파일 타임에 동작 가능한 코드만 작성 가능
- right-hand side에서 this 접근 불가
```dart
class SomeClass {
	String name;
	int number;

	SomeClass.fromJson(Map<String, int> json)
		: this.name = json['name']!,
		this.number = json['number']!;
}
```

### Redirecting factory constructor
abstract class가 다른 클래스의 constant constructor 제공 가능
```dart
factory Listenable.merge(List<Listenable> listenables) = _MergingListenable
```


## 참고
- https://dart.dev/language#classes
- https://dart.dev/language/constructors
- https://another-light.tistory.com/77
- https://medium.com/@shemsedinrobsen/understanding-factory-constructors-in-dart-and-flutter-a-comparison-with-static-methods-d03b471a7944