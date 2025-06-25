# 문자열 조작
## 문자열 (String)

- 일반적인 객체들과 메모리 관리 방식이 다르다

### String 클래스 안에는 변수가 존재하지 않는다 ⇒ 불변 객체

```dart
String name = '홍길동';

name = '한석봉';

name = name + '님';
```

- 기존의 인스턴스를 변경한 게 아닌 새로운 인스턴스를 만들고 참조를 변경하는 과정이다
- '홍길동', '한석봉', name + '님' 다 다른 인스턴스가 생성된다

### StringBuffer

- write() 메소드로 결합한 결과를 내부 메모리 (버퍼)에 담아 두고 toString()으로 결과를 얻는다

```dart
final buffer = StringBuffer('Dart');

buffer
	..write(' and ')
	..write('Flutter');
	
print(buffer.toString());
```

### 더하기 연산자로 String을 다루지 말자 (성능을 고려한다면)

- + 연산자가 느린 이유는 String 인스턴스가 불변 객체 (immutable) 이기 때문이다
- StringBuffer를 사용하는게 성능 면에서 떠 빠르다

```dart
인스턴스를 반복할 때마다 생성하기 때문에 일정 이상 생성하면 성능에 영향을 준다
String str = '';
for (int i = 0; i < 1000000; i++) {
	str += i.toString();
}

StringBuffer buffer = StringBuffer('');
for (int i = 0; i < 1000000; i++) {
	buffer.write(i.toString());
}
```

### 코드 성능 측정 방법

```dart
final stopwatch = Stopwatch()..start();
=========================
시간을 측정할 코드
=========================
print(stopwatch.elapsed);
```

```dart
String str1 = 'hello';
String str2 = 'hello';
print(identical(str1, str2);  => true

=========================================================================
str1은 컴파일 타임에 메모리에 생성되지만 str3는 생성자로 런타임에 생성된다
중복단 String인지 판단 자체가 불가능해서 재활용할 수 없다
=========================================================================
String str3 = String.fromCharCodes('hello'.codeUnits);
print(identical(str1, str3);  => false

==========================================================================
마찬가지로 컴파일 타임과 런타임의 시점 차이로 인해서 다른 곳에 생성된다
const 는 사용할 수 없다 => str4이 런타임이라서, 사용하면 컴파일러가 +를 무시한다
String str4 = 'hel' + 'lo'; 
print(identical(str1, str4));  => false

위와 마찬가지
String str5 = 'hel' + getLo();
print(identical(str1, str5));  => false

String getLo() {
	return 'lo';
}
```

### Accessor는 원본에 영향을 끼치지 않는다

- **String은 불변 객체이기 때문이다**
- 변한 내용을 리턴 해주는 기능이지 원본을 변형하지 않는다

### Mutator는 원본에 영향을 끼친다

- 수정한 내용을 리턴 해주는 게 아닌 원본을 수정하는 기능이다