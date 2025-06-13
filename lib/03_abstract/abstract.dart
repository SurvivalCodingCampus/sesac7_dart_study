void main() {
  Set<String> names = {};
}

// 추상클래스
abstract class Human {
  String name = '';

  void attack();
}

// 인터페이스
abstract interface class Attackable {
  void attack2();
}

class SuperMan extends Human implements Attackable {

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void attack2() {
    // TODO: implement attack2
  }

}