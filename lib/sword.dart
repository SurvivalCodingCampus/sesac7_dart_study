class Sword {
  String name;
  int dmg;
  int enforcement;

  Sword({required this.name, required this.dmg, this.enforcement = 0});

  void dmgBuff() {
    dmg += 5;
  }

  void tryEnforcement() {
    enforcement++;
  }
}
