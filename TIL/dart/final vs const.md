
### final vs const
런타임 상수
- 값이 실행 시점(런타임)에 결정되어 메모리에 할당됨
```dart
final String name = 'name';
```

컴파일 타임 상수
- 값이 컴파일 시점에 결정되어 메모리에 할당됨
```dart
const String name = 'name';
```

### static const vs final
```dart
class SomeClass {
	static const constants = 10; // static variable, class variable

	final String name = 'name'; // class member, instance variable
}
```

class member는 final만 사용 가능(const 사용 불가)
- 인스턴스가 있어야 사용할 수 있기 때문에 컴파일 타임에 먼저 메모리에 올라갈 수 없음

static은 인스턴스 없이 사용 가능
- 사용되기 전까지 초기화 안 됨


## 참고
- https://dart.dev/language/variables#final-and-const
- https://dart.dev/language/classes#using-class-members
- https://dart.dev/language/classes#static-variables