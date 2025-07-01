// 나중에 값을 바꿔도 되면	: 기본 생성자 Point()
// 객체 만들면서 값 바로 주려면 : Point(this.x, this.y)
// 값이 꼭 있어야 하며, 변하지 않게 하려면 :	Point(this.x, this.y) + final


// 01.class_instance Point {
//   int x = 2;
//   int y = 2;
//
//   Point() : x = 1, y = 2;
// }
//
// void main() {
// }

// 01.class_instance Point {
//   late final double x;
//   final double y;
//
//   Point(this.x, this.y);
// }
// void main() {
//   Point p = Point(3, 7); // 생성과 동시에 설정
//   p.x = 4;
//   print(p.x);
// }

class Account {
  final String owner;
  int _balance;

  int get balance => _balance;

  Account(this.owner, {int startMoney = 0}) : _balance = startMoney;

  void show() {
    print('$owner님의 잔액은 $_balance원입니다');
  }
}

class Account1 {
  final String owner;
  int _balance;

  // 초기화 리스트에서 this 사용하면 안됨 하지만 안드로이드에서는 됨. this를 지우라는 경고만 나옴
  // Account(this.owner, {int startMoney = 0}) : this._balance = startMoney {}

  // this 없이 초기화 리스트 사용
  Account1(this.owner, {int startMoney = 0}) : _balance = startMoney {
    // 이 시점부터는 this 사용 가능
    print('생성자 본문: this._balance = ${this._balance}');
  }
}


void main() {
  var a1 = Account('철수'); // 기본잔액 0
  var a2 = Account('영희', startMoney: 50000); // 기본잔액 50000

  a1.show(); // 철수님의 잔액은 0원입니다
  a2.show(); // 영희님의 잔액은 50000원입니다
}