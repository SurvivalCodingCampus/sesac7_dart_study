# Object 타입 vs object 객체

## Object 타입
- Dart의 모든 클래스의 최상위 타입
- 모든 클래스는 Object 클래스의 메서드와 프로퍼티를 가지고 있다
- Object 타입 변수에는 모든 인스턴스를 대입할 수 있다

### Object 클래스의 대표 메서드 및 프로퍼티
- 동등성 검사할때는 가지고있는 모든 것들을 확인하고 재정의해야 하는 것임

1. .toString(): 문자열 표현을 얻음
- 모든 object 가 가지고 있음, 암묵적으로
- print 할때 암묵적으로 toString()을 가지고 있다고 본다
- 객체의 내용을 알기쉽게 보여주기 위해서 toString 메서드를 사용한다

2. operator ==: 비교

```dart
// 동등성 비교 규칙 재정의
bool operator == (Hero hero) =>
    indentical(this, other) || //indentical : 실제 객체 참조 주소 비교
    other is Hero && 
    runtimeType == other.runtimeType &&
    name == other.name &&
    hp == other.hp;

// == 참조 비교
// 리스트 안에서도 비교 재정의 할 수 있다

```
3. hashcode
- 실행할때 마다 바뀌는 무작위의 값(메모리 주소를 볼수있는 방법이 없으니 메모리 주소를 보는 것이라고 개념을 이해해도 무방하다)
- 숫자로 구성되어있다
- object가 가지고 있는것이고 
- Set에서 사용
- 검색 속도가 빠르다

```dart
// 예시 _name.hashCode값과 _hp.hashCode값을 섞어서 하나의 고유한 새로운 hashcode를 생성하는 것
int get hashCode => _name.hashCode ^ _hp.hashCode;
```
- Set, Map 중복방지를 위해 객체를 비교할 때 hashCode를 확인한다

### hasecode 참고

- String 은 text 가 같으면 같은 hashcode 값, const 같이
- name.hashcode 로 비교해서 규칙을 재정의한다
- 복사한 값

---

## 객체 복사

0. immutable(불변) 타입인 객체들은 얕은 비교로만으로도 참조까지 비교 가능
0. 시스템에서 불변성을 유지(휴먼에러를 줄이기 위해서) 하면서 코드를 작성하기 위해 사용한다
0. 모든 필드에 final을 쓰는 방식으로 코드를 작성할 것이다

1. 얕은 복사 메서드: shallowCopy
- 참조 주소만 복사하는

```dart
class Person {
  final String name;
  final int age;
  final Address address;

  Person(this.name, this.age, this.address);

  // 깊은 복사
  Person shallowCopy() => Person(name, age, address);

  // address 참조 주소가 같기때문에 
  person2.address.street = '서울';
  person2.address.street = '부산';

  print(person1.address.street); // person1의 address도 '부산'으로 바뀜
  print(person2.address.street); // '부산'
}


```

2. 깊은 복사 메서드: deepCopy

```dart

class Person {
  final String name;
  final int age;
  final Address address;

  Person(this.name, this.age, this.address);

  Person.aaa(){ // 생성자에 이름을 붙이고 싶을때, 같은 필드를 쓰면서 용도만 명시해서 따로 관리하고 싶을때
    print('aaa');
  }

  // 깊은 복사
  Person deepCopy() => Person(name, age, address.deepCopy());
}
```
- address 가 참조 타입(class)이기 때문에 deepCopy()까지 해줘야 진짜 새로운 객체 전체가 생성됨
Q. 예시코드 재작성해보기

- 참조 타입의 필드가 있는 경우
```dart
Book copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
    Author? author, // 참조타입의 class가 있다면
  }){
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate
      author: author ?? this.author.copyWith(), // 한번더 메소드 붙여주고 author 안에서 copyWith을 작성해줘야한다
    );
  }
```
## 클래스의 기능 확장

- 클래스를 확장해서 기능을 사용하고 싶을때 클래스를 상속 시켜서 기능을 확장한다
- 그러나 기본적으로는 final 필드는 상속해서 확장해서 사용할 수 없도록 한다
- https://dart.dev/language/extension-metho
- 그럼에도 사용해야할때 extension을 사용해서 기능을 확장해야 할때
- extension 파일을 별도 분리해서 사용하면 편리하다

```dart
  extension StringExtension on String {
    int toInt() {
      return int.parse(this);
    }
  }
```

## object 객체
- 실제로 메모리에 존재하는 실체
- ex: final p = Person(); 에서 p는 객체
- 어떤 클래스의 인스턴스

## DateTime.now(): 이름이 있는 생성자 named construture
- 이름이 있는 생성자임 now
- 생성자 문법중에 하나이다
- 필드에 변수가 없는 불변 객체다
- 한번 생성되면 변하지 않는 값을 가지고 있다

