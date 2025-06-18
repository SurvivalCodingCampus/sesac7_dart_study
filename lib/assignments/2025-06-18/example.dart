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
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
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
}
