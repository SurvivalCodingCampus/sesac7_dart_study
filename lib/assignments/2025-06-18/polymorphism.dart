abstract class Monster {
  void run() {
    print('1');
  }
}

class Slime extends Monster {
  @override
  void run() {
    print('2');
  }
}

void main() {
  Slime sLime = Slime();
  Monster monster = Slime();

  Monster monster2 = Slime();
  Slime slime2 = monster2 as Slime;

  monster.run();
}

///default로 모든 육상선수를 후후하하 로 호흡하게 가르쳤다.
///껍데기가 뭐냐는 중요하지 않고, 실체가 뭐냐가 중요하다. Monster타입의 slime일때, Monster타입은 중요하지않다. slime인것이 중요하지. slime이 달리는거다.
