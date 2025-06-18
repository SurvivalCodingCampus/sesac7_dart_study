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
  Slime slime = Slime();
  Monster slime2 = Slime();

  slime.run();
  slime2.run();
}