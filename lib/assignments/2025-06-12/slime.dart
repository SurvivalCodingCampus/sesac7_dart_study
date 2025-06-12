import '../../hero.dart';

class Slime {
  // int hp;
  // final int level =
  //     10; //필드를 상수로 선언. 모든 슬라임은 레벨이 10이다. 상수 값은 이미 값이 정해져 있기 때문에 생성자에 넣지 않아도 된니까.
  // String suffix;
  //
  // Slime(this.hp, this.suffix);
  //
  // void run() {
  //   print('슬라임 $suffix 가 도망갔다!');
  // }

  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임 $suffix이/가 공격당했다.');
    print('10의 데미지');
    hero.hp -= 10;
  }
}
