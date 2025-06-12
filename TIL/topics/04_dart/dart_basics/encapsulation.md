# 캡슐화 (encapsulation)
- 클래스나 인스턴스를 이용하여 현실세계를 객체지향 프로그램으로 자유롭게 개발
- 휴먼 에러 방지를 위해 사용
- 데이터 필드와 데이터를 조작하는 행위(메서드)를 클래스 내부에 숨겨서 자기 자신만 사용할 수 있게 함

## 접근 지정자 (access modifier)
- private: 멤버(메서드나 필드) 앞에 _ 붙이기, 자기 자신의 클래스에 접근
- public: 기본 값, 모든 클래스에 접근

```dart
class Hero {
    String name;
    int _hp; // private 필드
    Sword? sword = null;

    Hero({required this.name, required int hp}) : _hp = hp;
    // Hero({required this.name, _hp});
    // 네임드 파라미터 안에 int this._hp 와 같은 형식으로 작성할 수 없음
}
```
### Named parameters can't start with an underscore.

```dart
Hero({required this.name, this._hp});
```
네임드 파라미터 안에 **this._hp** 와 같은 형식으로 작성할 수 없다

- 네임드 파라미터는 공개용(외부 노출)
- 외부에서 파라미터 이름을 보고 사용해야 함
- 외부에 보이지 않는 값을 네임드 파라미터에 쓰겠다는게 논리적으로 맞지 않음

### named parameter
- {} 중괄호 안에 선언한 파라미터
- 파라미터 명: 값 형태로 전달함
- this.파라미터명은 생성자내에서 생성자의 파라미터와 클래스의 필드가 동일한 이름일때 축약해서 초기화 할 수 있음
- 네임드 파라미터는 선택적으로 값을 전달 할 수 있음

```dart
class Person{
    final String name;
    final int age;

    Person(this.name, this.age);
}
```

- named parameter 에서는 **this.파라미터이름** 과 작성할 수 없음, 왜?
- A. named parameter 는 선택적으로 값을 전달할 수 있음
- this.파라미터이름 의 형태는 직접적으로 클래스 필드 영역에 연결하겠다는 의미
- named parameter 는 선택적으로 값이 안들어오면 클래스 필드가 초기화 되지 않음
- 전달될지 확실하지 않은 값을 필드에 바로 연결하지 못하게 함
- required 를 붙이거나 초기값을 할당하는 형태로 사용한다

```dart
class Person{
    final String name;
    final int age;

    Person({this.name, this.age});
    // 오류
    // required this.name 과 같은 형식으로 작성
}
```

## 메소드를 private 로 지정
생성자와 getter/setter 생략한 형태로 작성

```dart
class Hero {
    void bye() {
        print('bye~');
    }

    // private
    void _die() {
        print('dead!');
    }

    void attack(Slime slime){
        _hp -= 10;
        if (_hp < 0) {
            _die();
        }
    }
}
```

## getter 와 setter
메소드를 경유한 필드 조작

- getter: 읽기 전용 프로퍼티를 구현할 때 사용(_를 사용)
- setter: 쓰기 전용 프로퍼티를 구현할 때 사용(잘 안씀)

1. read only, write only 필드의 실현
2. 필드의 이름 등 클래스 내부 설계를 자유롭게 변경 가능
3. 필드로의 액세스를 검사 가능: 값을 읽거나 쓸때 단순히 저장/반환만 하지 않고 유효성 검사나 조건처리 등을 추가할 수 있음

### 프로퍼티
- getter/setter 메서드를 캡슐화하여 필드처럼 직접 접근할 수 있도록 하는 문법적 요소

## getter
private 상태가 된 필드를 읽기위해 getter 사용

```dart
class Hero{
    static int money = 100;
    String name;
    int _hp; // private 캡슐화

    int get hp => _hp;

    // getter는 외부에서 상수처럼 보이지만 아래와 같이 풀어쓴것과 같다
    // int get hp => _hp; 와 같음
    int get hp{
        return _hp;
    }
}
```

## setter
setter는 함수처럼 동작

```dart
class Person{
    String _name; // private 필드
    int _age; // private 필드

    Person(this._name, this._age);
    
    // getter
    String get name => _name;
    int get age => _age;

    // setter: 함수처럼 동작
    set name(String value) => _name = value;
    set age(int value) {
        if(value >= 0) { // 유효성 검사 추가
            _age = value;
        }
    }
}
```

- get, set 이 단순하게 값을 전달/저장 하고만 있다면 private 필드를 사용할 이유가 없음
- 필드를 public 으로 만들면 간단해짐


## 클래스에 대한 엑세스 제어
```dart
class _A {}
```
- 위와 같은 방법으로 전체 클래스에 대한 엑세스를 제어할 수 있다