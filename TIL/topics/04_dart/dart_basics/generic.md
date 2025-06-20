# 제네릭
- 타입 안정성을 위해 사용한다

<E> : elements
<K> : key
<V> : value

```dart
Pocket<int> pocket = Pocket(); // 타입 명시를 안하면 dynamic 타입이 되어버린다
Pocket<Book> pocket = Pocket(); 
```

# enum 열거형
- 정해둔 값만 넣어둘 수 있는 타입

```dart
// enum 정의: 내가 정의한 나만의 값
enum AuthState {
  authenticated,
  unauthenticated,
  unknown,
}

void main() {
  AuthState authState = AuthState.unknown;

  // 상태에 따른 처리: 강제로 모든 정의한 값에 대한 분기를 처리해야함
  switch (authState) {
    case AuthState.authenticated:
      print('authenticated');
      break;
    case AuthState.unauthenticated:
      print('unauthenticated');
      break;
    case AuthState.unknown:
      print('unknown');
      break;
  }
}
```

```dart
void main() {
    String name = '홍길동'; // 1
    name = '한석봉';

    // name 은 1번 값이 한석봉으로 바뀌는 것인가? 아님 새로운 주소를 참조하게 됌
    // heap 에 새로운 인스턴스를 만들어서 주소를 변경한것이다
    // 홍길동이 (heap) 컴파일 타임에 결정되는 메모리 공간에 먼저 생성
    // stact 에 name 생성 - 홍길동이라는 주소를 참조하게 된다

    name = '$name'님; // 3
    // 3번도 홍길동님이라는 만들어내면서 새로운 주소를 참조하게 된다 

    // heap에 여러개 생성된 것이다
    
    // 속도가 느리다
    name = name + '님';

    // 바뀌지 않는 불변의 값을 사용할 것이라면 default 값을 바라보고 copyWith 을 사용하는 방식으로 사용한다

}
```
- String은 불변객체 변하지 않는다
- Dart 는 싱글스레드 언어라서 StringBuffer 하나 있다
- String은 값이 같은게 있다면 string 풀에서 재활용 한다, 자주 사용을 하기 때문에

## StringBuffer
- 내부 메모리에 두고 StringBuffer 담아두고 toString()으로 결과를 얻음


## .. void 리턴인 함수의 앞에 사용하면 해당 객체의 레퍼런스를 반환하여 메서드 체인을 사용할 수 있다
```dart
buffer
    ..write('and')
    ..write('Flutter');
```
cascade

```dart
void main() {
  String str1 = 'hello'; // 컴파일타임
  String str2 = 'hello';
  print(identical(str1, str2)); // true

  String str3 = String.fromCharCodes('hello'.codeUnits); // 런타임에 결정됨
  print(identical(str1, str3)); // false

  String str4 = 'hel' + 'lo'; // + 때문에 런타임에 결정된다
  print(identical(str1, str4)); // false 

  String str5 = 'hel' + getLo(); // + 때문에 런타임에 결정된다
  print(identical(str1, str5)); // false
}

String getLo() {
  return 'lo';
}
```

## accessor 돌려주는것, mutator

```dart
String greeting = ‘Hello’; // String 이 불변이라서

print(greeting.replaceAll(‘H’, ‘J’)); // Jello hello 참조해서 바꾸기만 한거지 직접 참조 데이터를 변경한게 아니라서, String 이 불변이라서
print(greeting); // Hello
```






