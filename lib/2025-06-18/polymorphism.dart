// 인터페이스 정의
abstract class Drawable {
  void draw();
}

// 추상 클래스
abstract class Character {
  final String name;
  int hp;
  Character(this.name, this.hp);
  void attack(Monster monster);
}

abstract class Monster {
  int hp = 100;
  void run();
}

// 구체 클래스
class Slime extends Monster {
  @override
  int hp = 50;
  final String suffix;
  Slime(this.suffix);

  @override
  void run() {
    print('슬라임$suffix이/가 도망쳤다.');
  }

  @override
  String toString() => '슬라임$suffix';
}

class Wizard extends Character {
  int mp = 100;
  Wizard(super.name, super.hp);

  @override
  void attack(Monster monster) {
    print('$name이 $monster을 공격했다.');
    monster.hp -= 20;
  }

  void fireball(Slime slime) {
    print('$name이 파이어볼을 쏘았다.');
    slime.hp -= 50;
    mp -= 20;
  }
}

// 핵심 예제: 다형성 실패 예시
void main(List<String> arguments) {
  Wizard wizard = Wizard('마법사', 50);
  Character character = wizard; // 업캐스팅
  Slime slime = Slime('A');

  character.attack(slime); // OK: Character에 정의된 메서드
  // character.fireball(slime); // 컴파일 에러: Character 타입에는 fireball 없기때문에 컴파일러가 인식하지 못함
} 
