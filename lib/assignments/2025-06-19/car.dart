import 'package:collection/collection.dart';

class Car implements Comparable<Car> {
  String name;
  Engine engine;

  Car({required this.name, required this.engine});

  @override
  int compareTo(Car other) {
    // TODO: implement compareTo
    return name.compareTo(other.name);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Car &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          engine == other.engine;

  @override
  int get hashCode => name.hashCode ^ engine.hashCode;

  @override
  String toString() {
    return 'Car{name: $name, engine: $engine}';
  }

  Car copyWith({String? name, Engine? engine}) {
    return Car(name: name ?? this.name, engine: engine ?? this.engine);
  }
}

class Engine {
  int version;

  Engine({required this.version});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Engine &&
          runtimeType == other.runtimeType &&
          version == other.version;

  @override
  int get hashCode => version.hashCode;

  @override
  String toString() {
    return 'Engine{version: $version}';
  }
}

void main() {
  Engine engine = Engine(version: 1);
  Car car = Car(name: 'Grandeur', engine: engine);
  Car car2 = car.copyWith();
  Car car3 = car.copyWith(name: 'Tesla');
  Car car4 = car.copyWith(engine: Engine(version: 2));
  Car car5 = car.copyWith(name: 'Porsche', engine: Engine(version: 3));

  print(car);
  print(car2);
  print(car3);
  print(car4);
  print(car5);

  List<Car> list = [car, car2, car3, car4, car5];
  final sortedList = list.sorted(
    (a, b) => -a.engine.version.compareTo(b.engine.version),
  );
  print(list);
  print(sortedList);
}
