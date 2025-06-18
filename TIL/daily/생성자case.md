# 나중에 값을 바꿔도 되면	: 기본 생성자 Point()
```dart
class Point {
  int x;
  int y;
  
  Point(); // 기본 생성자
}

void main() {
  Point p = Point();
  p.x = 3;
  p.y = 7;
}
```

# 객체 만들면서 값 바로 주려면 : Point(this.x, this.y)
```dart
class Point {
  int x;
  int y;

  Point(this.x, this.y); // 생성자에서 바로 값 받음
}

void main() {
  Point p = Point(3, 7); // 생성과 동시에 설정
}
```

# 값이 꼭 있어야 하며, 변하지 않게 하려면 : Point(this.x, this.y) + final
```dart
class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}
void main() {
  Point p = Point(3, 7); // 생성과 동시에 설정
}
```

# 클래스 생성자에서 사용
## 이름을 지정해서 선택적으로 전달할 수 있는 인자
```dart
class User {
  String name;
  int age;

  User({this.name = 'Guest', this.age = 0});
}

void main() {
  var u1 = User(); // name: Guest, age: 0
  var u2 = User(name: 'Tom'); // name: Tom, age: 0
  var u3 = User(age: 40); // name: Guest, age: 40
}
```

## 초기화 리스트 
# 생성자 본문이 실행되기 전! private 변수나 final 변수에 값을 할당할 때 사용하는 특별한 문법
# 주로 final, late, private (_변수) 초기화에 사용된다.
# 아래의 예제에서 : _balance = startMoney	초기화 리스트 실행 (this 불가능)
# -> 이니셜라이즈 즉 초기화리스트는 객체가 완전히 만들어지기 전에 실행, this는 객체가 완전히 초기화 된후에만 사용가능
# 결론적으로 this._balance 안된다.


```dart
class Account {
  final String owner;
  int _balance;

  Account(this.owner, {int startMoney = 0}) : _balance = startMoney;
  // 🎯 실행 순서
  // 1. 선택적 인자 startMoney에 기본값이 할당됨
  //  → startMoney = 0 또는 사용자가 넘긴 값
  // 2. 초기화 리스트 실행됨 (: _balance = startMoney)
  //  → this._balance가 먼저 설정됨 (이때 this 사용 불가능)
  // 3. 필드 this.owner에 값이 할당됨 (this.owner)
  // 4. 생성자 본문 { ... } 실행됨
  
  void show() {
    print('$owner님의 잔액은 $_balance원입니다');
  }
}

void main() {
  var a1 = Account('Tom'); // 기본잔액 0
  var a2 = Account('영희', startMoney: 50000); // 기본잔액 50000

  a1.show();
  a2.show();
}
```

# final 필드를 사용 못하는 케이스
 - Wizard(...) : _name = name;
    - Dart 권장 스타일, final 필드나 assert, super() 같이 사용
   
 - Wizard(...) { _name = name; }
    - 문법적으로 맞지만, 하지만 final 필드는 초기화 불가능!

# 복합적으로 사용된 형태
Wizard() : _name = name {
name = _name;
hp = _hp;
mp = _mp;
wand = _wand;
}

생성자 본문에서 setter 사용
name = _name;
hp = _hp;
mp = _mp;
wand = _wand;
이렇게 사용하면 필드에 바로 대입하지 않고, setter를 한 번 더 호출해서 검증까지 처리할 수 있다.

# 위치기반 생성자 - 위치 기반으로 해야함 - 즉 순서대로 호출해야됨
Wizard(this._name, this._hp, this._wand, [int mp = 100])

```dart
// Wizard('aa', 100, wand);           // mp는 기본값 100
// Wizard('aa', 100, wand, 200);      // mp는 200
```

