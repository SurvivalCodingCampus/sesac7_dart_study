class Address {
  final String street;

  Address({required this.street});

  // Address copyWith() => Address(street: street);
  Address copyWith({String? street}) => Address(street: street ?? this.street);
}

class Person {
  final String name;
  final int age;
  final Address address;

  Person({required this.name, required this.age, required this.address});

  // Person copyWith() =>
  //     Person(name: name, age: age, address: address.copyWith());
  Person copyWith({String? name, int? age, Address? address}) => Person(
    name: name ?? this.name,
    age: age ?? this.age,
    address: address ?? this.address.copyWith(),
  );
}

void main() {
  Address address = Address(street: '서울시 강서구');
  Person p1 = Person(name: '이기혁', age: 26, address: address);
  Person p2 = p1.copyWith();

  print(p1.address.hashCode);
  print(
    p2.address.hashCode,
  ); //깊은 복사를 했기 때문에, address의 hashCode가 다름. 얉은 복사를 통해서 복제하면 같은 address를 가지게되어, 같은 hashCode가 나옴.
  print(identical(p1, p2)); // copyWith로 결국 복제하면 다른 객체.
}
