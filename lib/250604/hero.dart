import 'package:modu_3_dart_study/250604/cleric.dart';

class Hero{
  String name;
  int hp;

  // 생성자
  Hero(this.name, this.hp);

  void attack(){
    print('$name is attacking!');
  }

  void run(){
    print('$name is running away!');
  }

  void sit(){
    print('$name is sitting for 2 seconds.');
  }

  void slip(){
    print('$name slipped and fell!');
  }

  void sleep(){
    hp = 100;
    print('$name is sleeping.');
  }

}
void main(){
  Hero hero = Hero('홍길동', 100);

  // 공격, 도망, 잠자기
  hero.attack();
  hero.run();
  hero.sleep();
}