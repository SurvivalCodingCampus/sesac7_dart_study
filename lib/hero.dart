class Hero {
    String name;
    int hp;
    final int maxHp;

    // 생성 시 현재 HP를 최대 HP로 설정
    Hero(this.name, {required this.hp}) : maxHp = hp;

    void receivedHeal(int heal) {
        if (heal <= 0) return; // 음수/0 회복은 무시
        hp = (hp + heal > maxHp) ? maxHp : hp + heal;
    }

    void receiveDamage(int amount) {
        hp = (hp - amount < 0) ? 0 : hp - amount;
    }

    void damages() {
        hp = hp > 0 ? hp - 1 : 0;
    }
    void run() {
        // TODO: 도망가기 로직 구현
    }
    void sleep() {
        hp = maxHp;
        print('$name 은 잠을 자고 회복했다.');
    }
    void sit() {
        // TODO: 앉기 로직 구현
    }
}