import 'key_type.dart';

class StrongBox<E> {
  E? _data; //금고 클래스에 담는 인스턴스의 타입은 미정
  KeyType keyType; //열쇠의 종류를 나타내는 필드 추가

  int _openCount = 0;

  void put(E data) {
    //금고에는 1개의 인스턴스를 담을 수 있음
    _data = data;
  }

  //3) put() 메서드로 인스턴스를 저장하고 get() 메서드로 인스턴스를 얻을 있음

  // get() 으로 얻을 때는 별도의 타입 캐스팅을 사용하지 않아도 됨

  E? get() {
    //금고에서 get() 메서드를 호출할 때 마다 사용횟수를 카운트하고 각 열쇠의 사용횟수에 도달하기 전에는 null을 리턴한다.

    if (_openCount < keyType.remainCount) {
      _openCount++;
      return null;
    }
    return _data;
  }

  StrongBox({required this.keyType}); //열쇠의 종류를 받는 생성자
}

// enum keyType {}

//keyType을 저장하는 필드와 생성자. 생성자를 통해서 keyType지정해라.
//4개의 타입이 있는데 , get()을하면 각 키타입에 맞게끔, 이횟수만큼의 실패를 하고 1024번이 넘으면 그때 그 데이터를 얻을 수 있다.
//10000번 버튼은 null리턴하고, 넘으면 get할수있게 .

//
