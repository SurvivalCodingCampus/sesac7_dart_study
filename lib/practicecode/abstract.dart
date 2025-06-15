// 추상 클래스 -> 상속
abstract class Human{
  // String name = ''; //  만약에 이렇게 하면 추상클래스대로 되버려
  // 결론 추상클래스틑 상속만한다.

  void attack();
}

//인터페이스 -> 구현
abstract interface class Attactable{

}

class SuperMan extends Human{
  @override
  void attack() {
    // TODO: implement attack
  }

}