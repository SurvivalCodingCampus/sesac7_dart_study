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
    // String 은 불변의 값이라서
    // heap 에 새로운 인스턴스를 만들어서 주소를 변경한것이다
    
    // 홍길동이 (heap) 컴파일 타임에 결정되는 메모리 공간에 먼저 생성
    // stact 에 name 생성 - 홍길동이라는 주소를 참조하게 된다
    // 코드에 직접 쓴 문자열 값, 리터럴 
    // 리터럴 문자열은 컴파일 타임에 intern pool 에 올라감(heap) 에 고정 위치 차지

    name = '$name님'; // 3
    // 3번도 홍길동님이라는 만들어내면서 새로운 주소를 참조하게 된다 

    // heap에 여러개 생성된 것이다
    
    // 속도가 느리다
    name = name + '님';

    // 바뀌지 않는 불변의 값을 사용할 것이라면 default 값을 바라보고 copyWith 을 사용하는 방식으로 사용한다

}
```
- String은 불변객체 변하지 않는다
- Dart 는 싱글스레드 언어라서 StringBuffer 하나 있다
- String은 값이 같은게 있다면 intern pool에서 재활용 한다, 자주 사용을 하기 때문에

+ 메모리 절약을 위해 "hello" 같은 문자열이 수천번 등장해도 메모리는 1개만 사용됨
```dart
void main() {
  String a = 'hello';
  String b = 'hello';

  print(identical(a, b)); // true
}
```
- 리터럴 문자열이라 Dart는 한 번만 메모리에 올려서 재사용 -> interning 

## StringBuffer: 임시저장공간
- 내부 메모리에 두고 StringBuffer 담아두고 toString()으로 결과를 얻음
- + 일반적인 문자열 결합보다 훨씬 성능이 좋고 메모리 낭비가 적다

## .. void 리턴인 함수의 앞에 사용하면 해당 객체의 레퍼런스를 반환하여 메서드 체인을 사용할 수 있다
```dart
buffer
    ..write('and')
    ..write('Flutter');
```
cascade

```dart
void main() {
  Hero hero1 = Hero(name: '홍길동'); // 사용자 정의 클래스의 인스턴스, 참조 타입
  Hero hero2 = Hero(name: '홍길동');

  print(identical(hero1, hero2)); // false  

  // "홍길동" String 값은 같은 리터럴이면 힙의 특별한 구역인 interen pool에 들어가고 같은 주소 참조됨
  // 그러나 hero1, hero2가 Hero 인스턴스(사용자정의)이기 때문에 heap 에 각각 새로 생성된다

  String str1 = 'hello'; // 컴파일타임, primitive type String 불변의 값
  String str2 = 'hello';
  print(identical(str1, str2)); // true

  String str3 = String.fromCharCodes('hello'.codeUnits); // 런타임에 결정됨
  print(identical(str1, str3)); // false

  String str4 = 'hel' + 'lo'; // + 때문에 런타임에 결정된다 ??
  print(identical(str1, str4)); // false 

  String str5 = 'hel' + getLo(); // + 때문에 런타임에 결정된다
  print(identical(str1, str5)); // false
}

String getLo() {
  return 'lo';
}
```
## 접근자(Accessor), 변경자(Mutator)
- accessor 돌려주는것, mutator

1. Accessor: 객체의 내부 상태를 조회만 하는 메서드
- 객체의 속성을 변경하지 않음, 불변성 유지
- river.toUpperCase();
- 반환값 있음

2. Mutator: 객체의 내부 상태를 변경하는 메서드
- 쓰기, 수정 역할
- 객체를 직접 조작함, 가변상태
- pic.translate(15, 25); 
- 반환값이 없어도 pic 내부 좌표 상태가 바뀜

```dart
String greeting = 'Hello'; // String 이 불변이라서

print(greeting.replaceAll('H', 'J')); // Jello hello 참조해서 바꾸기만 한거지 직접 참조 데이터를 변경한게 아니라서, String 이 불변이라서
print(greeting); // Hello
```

## .. : cascade 연산자
- void 를 리턴하는 메서드 앞에서 메서드 체인을 가능하게 해준다
```dart
buffer
  ..write(' and ') // buffer.write(' and ');
  ..write('Flutter'); // buffer.write('Flutter');
```

## 코드 성능 측정
```dart
final stopwatch = Stopwatch()..start();

// 시간 측정할 코드

print(stopwatch.elapsed);

```

## 문제
```dart
  // 1번
  String greeting = 'Hello';

  print(greeting.replaceAll('H', 'J')); // Jello 값만 참조해서 출력한것이지 hello 불변 객체
  print(greeting); // Hello
  
  // 2번 
  Rectangle<num> box = Rectangle(5, 10, 60, 40);
  print(box.left); // 5
  print(box.width); // 10

  // box.translate(25, 40); translate 는 mutator이므로 값이 바뀜
  box = Rectangle<num>(box.left + 25, box.top, box.width + 40, box.height);
  print(box.left); // 30
  print(box.width); // 100

  // 3번
  Rectangle box1 = Rectangle(5, 10, 60, 90);
  Rectangle box2 = box1; // 동일한 인스턴스를 참조함
  box1.translate(100, 100); // 객체 내부의 값을 바꾸는 Mutator이기 때문에 둘다에게 영향

  box1.x = ? // 105
  box2.x = ? // 105

  // 4번
  String greeting1 = 'Hello, World!';
  String greeting2 = greeting1; // greeting1의 값을 참조
  greeting2.toUpperCase(); // 문자열을 반환할 뿐 실제 값을 바꾸지 않는다

  print(greeting1); // Hello, World!
  print(greeting2); // Hello, World!

  // 5번
  int luckyNumber1 = 13;
  int luckyNumber2 = luckyNumber1;
  luckyNumber2 = 12;

  luckyNumber1 = 13;
  luckyNumber2 = 12;  
```








