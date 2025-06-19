abstract class Entity {
  int hp;

  Entity({required this.hp});
}

abstract class Unit extends Entity {
  int movingSpeed;

  Unit(this.movingSpeed, {required super.hp});

  void move();
}

abstract class Structure extends Entity {
  Structure({required super.hp});
}

abstract interface class Terran {}

abstract interface class Zerg {
  void regenerate();
}

abstract interface class Protoss {
  void shieldGenerate();

  int get shield;

  set shield(int value);
}

abstract interface class Healable {}

abstract interface class Attackable {
  void attack(Entity entity);

  int get damage;

  set damage(int value);
}

abstract interface class Bionic {}

abstract interface class Mechanic {}

abstract class BionicUnit extends Unit implements Bionic, Healable {
  BionicUnit(super.movingSpeed, {required super.hp});
}

abstract class BionicStructure extends Structure implements Bionic {
  BionicStructure({required super.hp});
}

abstract class MechanicUnit extends Unit implements Mechanic {
  MechanicUnit(super.movingSpeed, {required super.hp});
}

abstract class MechanicStructure extends Structure implements Mechanic {
  MechanicStructure({required super.hp});
}

class Mineral {}

class SCV extends MechanicUnit implements Healable, Attackable, Terran {
  int _scv_damage;

  SCV(super.movingSpeed, {required super.hp, required int damage})
    : _scv_damage = damage;

  @override
  int get damage => _scv_damage;

  @override
  set damage(int value) {
    _scv_damage = value;
  }

  @override
  void attack(Entity entity) {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }

  void repair(MechanicUnit mechanicUnit) {}

  void extract(Mineral mineral) {}
}

class Tank extends MechanicUnit implements Attackable, Terran {
  int _tank_damage;

  Tank(super.movingSpeed, {required super.hp, required int damage})
    : _tank_damage = damage;

  @override
  int get damage => _tank_damage;

  @override
  set damage(int value) {
    _tank_damage = value;
  }

  @override
  void attack(Entity entity) {
    print('Tank가 ${entity.runtimeType}를 공격한다.');
    entity.hp -= damage;
  }

  @override
  void move() {
    print('Tank가 $movingSpeed 속도로 움직인다.');
  }
}

class Marine extends BionicUnit implements Terran, Attackable {
  int _marine_damage;

  Marine(super.movingSpeed, {required super.hp, required int damage})
    : _marine_damage = damage;

  @override
  // TODO: implement damage
  int get damage => _marine_damage;

  @override
  set damage(int value) {
    _marine_damage = value;
  }

  @override
  void attack(Entity entity) {
    print('Marine Attack');
  }

  @override
  void move() {
    print('Marine Move');
  }
}

class Medic extends BionicUnit implements Terran {
  Medic(super.movingSpeed, {required super.hp});

  //힐을 하려면 유닛마다 얼마만큼의 힐을 할건지, 힐량이 있어야함.

  void heal(BionicUnit bionicUnit) {
    bionicUnit.hp += 10;
  }

  @override
  void move() {
    print('Medic Move');
  }
}

class Zergling extends BionicUnit implements Zerg, Attackable {
  int _zergling_damage;

  @override
  // TODO: implement damage
  int get damage => _zergling_damage;

  @override
  set damage(int value) {
    _zergling_damage = value;
  }

  Zergling(super.movingSpeed, {required super.hp, required int damage})
    : _zergling_damage = damage;

  @override
  void attack(Entity entity) {
    print('Zergling Attack');
  }

  @override
  void move() {
    print('Zergling Move');
  }

  @override
  void regenerate() {
    print('Zerg 종족의 특성인 자가 회복기능');
    hp += 10;
  }
}

class Zealot extends MechanicUnit implements Protoss, Attackable {
  int _zealot_damage;
  int _zealot_shield;

  @override
  // TODO: implement damage
  int get damage => _zealot_damage;

  @override
  set damage(int value) {
    _zealot_damage = value;
  }

  @override
  set shield(int value) {
    _zealot_shield = value;
  }

  @override
  int get shield => _zealot_shield;

  Zealot(
    super.movingSpeed, {
    required super.hp,
    required int damage,
    required int shield,
  }) : _zealot_damage = damage,
       _zealot_shield = shield;

  @override
  void attack(Entity entity) {
    print('Zealot Attack');
  }

  @override
  void move() {
    print('Zealot Move');
  }

  @override
  void shieldGenerate() {
    print('Protoss 종족의 특성은 방어막 회복');
  }
}

void main() {
  SCV scv = SCV(10, hp: 30, damage: 1);
  Tank tank = Tank(40, hp: 100, damage: 5);

  scv.attack(tank);

  Unit scv1 = SCV(100, hp: 100, damage: 100);

  List<SCV> list = [scv];

  if (scv1 is SCV) {
    list.add(scv1);
  }

  for (final item in list) {
    print(item.runtimeType);
  }
  tank.move();
  tank.attack(scv1);
  print(scv1.hp);
}
