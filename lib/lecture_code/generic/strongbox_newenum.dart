/*
https://dart.dev/language/enums#declaring-enhanced-enums

  enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
*
* */

class Lock {
  String name;
  bool unlock;

  set(){
    unlock = true;
  }
  Lock({required this.name, this.unlock = false});
}

enum KeyType {
  padlock(limitNum: 1024),
  button(limitNum: 10000),
  dial(limitNum: 30000),
  finger(limitNum: 1000000);

  // 시도한도횟수
  final int limitNum;
  // 생성자
  const KeyType({required this.limitNum});
}

class StrongBox<T> {
  int checkLimitNum;
  KeyType keyType;
  T? _data;
  Lock lock;

  StrongBox(this.keyType) : checkLimitNum = 0, lock = Lock(name: '홍길동', unlock: false);

  void put(T data) {
    _data = data;
  }

  T? get() {
    checkLimitNum++;
    if (checkLimitNum < keyType.limitNum) {
      return null;
    } else {
      lock.set();
      return _data;
    }
  }
}