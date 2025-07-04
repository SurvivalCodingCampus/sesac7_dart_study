# Dart 생성자(constructor)

## 1. 클래스로부터 인스턴스(붕어빵)를 만들때 처음 실행되는 함수!
- 클래스:  설계도, 앞에 new 가 생략된 형태로 작성
- Q. 클래스 필드에 const를 사용할 수 있나요?
- A. 클래스 필드에는 static const 만 사용가능하다. 인스턴스 필드는 final을 사용해야 한다.
- A. 생성자는 런타임에 생성되는 함수이기 때문에 컴파일 타임에 생성되는 const 를 필드값으로 설정할 수 없다.
- A. 클래스가 인스턴스화 되었을때 사용하는 값들이 필드에 있기 때문에 필드에 직접적으로 const 사용 불가

## 2. 괄호에 따라 생성자 모양 차이
- `Name()`: 기본 생성자
- `Name(String firstName)`: 위치기반 매개변수
- `Name(this.firstName)`: 필드를 바로 초기화하는 축약 문법
- `Name({this.name})`: 이름 있는 매개변수(선택가능), named parameter
- `Name({required this.name})`: 이름 있는 매개변수(필수 지정), 데이터 타입이 null 을 허용하지 않으면 required 를 붙여야 함
- `Name(this.hp, this.mp,{required this.name})` 필수 parameter 와 named parameter를 동시에 사용할 경우 필수 parameter 가 앞에 와야함
- named parameter 에서만 기본값 지정이 가능

## 3. const 생성자
- 필드가 모두 final 일때 const 생성자를 만들 수 있다
```dart
class User {
    final String name;
    final int age;

    const User({
        required this.name,
        required this.age,
    });
}

void main () {
    User user1 = const User(name : 'name', age: 20);
    User user2 = const User(name : 'name', age: 20);
    print(identical(user1, user2)); //true
}

// const 붙이면 컴파일 타임에 생성되서 같은 객체를 참조하고 있다
// const 가 안붙으면 user1, user2 다른 객체이다
// 효율을 끌어올릴 수 있다!
// copyWith 은 항상 새로운 객체

```

4. factory 생성자

- facrtory 붙어있을때: factory는 미리 조작해서 런타임에 조작해서 리턴 할 수 있음
- 안붙어있을때: 컴파일 타임에 확정되고 런타임에 조작할 수 없음

| 구분             | 일반 생성자                        | factory 생성자                                                   |
|------------------|------------------------------------|-------------------------------------------------------------------|
| **객체 생성 방식** | 항상 직접 `new Comment(...)`         | 내부 로직에서 조건 따라 다른 객체 생성 가능                           |
| **제약**          | 항상 `this` 인스턴스를 반환          | `this` 아니어도 됨. 다른 클래스 객체도 반환 가능                         |
| **언제 씀?**       | 그냥 값 넣어서 바로 객체 만들고 싶을 때 | JSON 파싱, 캐시된 객체 재사용, 조건 분기 등 유연하게 만들고 싶을 때       |

- 두 생성자가 항상 같이 명시해 줘야하는 것은 아니다

