// 인터페이스 정의
abstract interface class Drawable {
  void draw();
}

class Color{
  static String white = 'white';
}

class House implements Drawable{
  String address;
  int size;
  String color;

  @override
  void draw(){
    print('집을 그립니다');
  }
  
  House({required this.address, required this.size, required this.color});
}


class Tree implements Drawable{
  double height;
  Tree({required this.height});

  @override
  void draw(){
    print('나무를 그립니다');
  }
}

class Dog implements Drawable{
  String name;
  int age;

  Dog({required this.name, required this.age});

  @override
  void draw(){
    print('개를 그립니다');
  }
}

// 단일 Drawable 요소 생성
// Drawalbe 타입을 가지는 element 라는 이름을 가진 final 변수가 House 라는 인스턴스를 담고있다.
final Drawable element = House(
  address: '서울시',
  size: 100,
  color: Color.white, 
  // 이렇게 선언하려면 color 클래스의 인스턴스가 있어야 하기때문에
);

// Drawalbe 목록 생성
final List<Drawable> elements = <Drawable>[
  Dog(name: '멍멍이', age: 3),
  House(address: '부산시', size: 35, color: 'red'),
  Tree(height: 5.0),
];


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
  // ignore: overridden_fields
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

// 다형성 실패 예시
void main(List<String> arguments) {
  Wizard wizard = Wizard('마법사', 50);
  Character character = wizard; 
  Slime slime = Slime('A');

  character.attack(slime); // OK: Character에 정의된 메서드
  // 정적타입은 Character 이지만 런타임에는 wizard의 메서드가 실행
  
  // character.fireball(slime); // 컴파일 에러: Character 타입에는 fireball 없기때문에 컴파일러가 인식하지 못함
} 
