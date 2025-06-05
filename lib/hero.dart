class Hero {
    String name;
    int hp;

    Hero(this.name, this.hp);

    void damages() {
        hp --;
    }
    void run() {}
    void sleep() {
        hp = 100;
        print('$name 은 잠을 자고 회복했다.');
    }
    void sit() {}
}