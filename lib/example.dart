class AssertExample {
  final String name;
  final int age;

  AssertExample(String userSetName, int userSetAge)
    : assert(userSetName.length >= 3, '이름은 3글자 이상이어야'),
      assert(userSetAge <= 130 && userSetAge >= 18, '나이는 18세이상 130세 이하이어야'),
      name = userSetName,
      age = userSetAge;
}

abstract class Character {
  String name;

  Character(this.name);

  void run() {
    print('run');
  }

  void attack();
}

class Dancer extends Character {
  Dancer(super.name);

  @override
  void attack() {
    // TODO: implement attack
  }
}

abstract interface class Attackable {
  void attack();

  void defend();
}

class Attacker implements Attackable {
  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void defend() {
    // TODO: implement defend
  }
}

void main() {
  AssertExample assertExample = AssertExample('송상민', 140);
  Attacker attacker = Attacker();
}
