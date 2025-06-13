class Slime{
  int hp = 50;
  final String suffix;

  static int defaultAttack = 10;

  Slime(this.suffix);

  void attack(Hero hero){
    print('슬라임 $suffix이/가 공격했다');
    print('10의 데미지');
    hero.hp -= defaultAttack;
  }
}

// 클래스 명 pascal
class Hero{

  // 기본 hp 값
  static double defaultHp = 50;

  // 필드영역
  // 필드명 camelcase
  String name;
  double hp;

  Hero({required this.name, this.hp = 0}); // 생성자

  // 싸우기와 도망만 되는 Hero 클래스
  // 메소드명 camelcase
  void attack(Slime slime){
    print('$name 이 $slime 을 공격했다');
    hp -= 10;
  }

  void run(){
    print('$name 이 도망쳤다');
  }
}

// Hero 에서 상속받은 SuperHero
class SuperHero extends Hero{

  SuperHero({required super.name, required super.hp});
  

  // super의 의미는 super class
  // SuperHeor 는 sub class

  bool _isFlying = false;
  bool get isFlying => _isFlying;

  set isFlying(bool value){
    _isFlying = value;

    if (value) {
      print('$name 이 날개를 펼쳤다');
    } else {
      print('$name 이 날개를 접었다');
    }
  }

  @override
  void run(){
    print('$name 이 퇴각했다');
  }
}

void main(List<String> arguments) {
  // final hero = SuperHero(name: '홍길동', hp: 100);
  // hero.run(); 
  // super class hero 에서 생성한 메서드 run 이 sub class SuperHero 에서 동작한다

  final hero = Hero(name: '홍길동', hp: 100);
  hero.run(); 

  final superhero = SuperHero(name: '한석봉', hp: 50);
  superhero.run(); 
}

// print 결과값
// 홍길동이 도망쳤다
// 한석봉이 퇴각했다