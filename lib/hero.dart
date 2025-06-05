class Hero {
    String name;
    int hp;
    final int maxHp;

    // 생성 시 maxHp도 추가적으로 셋팅
    Hero(this.name, this.hp) : maxHp = hp;

    void damages() {
        hp --;
    }
    void run() {}
    void sleep() {
        hp = maxHp;
        print('$name 은 잠을 자고 회복했다.');
    }
    void sit() {}
}