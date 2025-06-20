// 깊은 복사 (Deep Copy)
class Address {
  String street;

  Address(this.street);

  // 깊은 복사 메서드
  Address deepCopy() => Address(street);
}

class Person {
  final String name;
  final int age;
  final Address address;

  Person(this.name, this.age, this.address);

  // 깊은 복사 메서드
  Person deepCopy() => Person(name, age, address.deepCopy()); // 주소 객체도 새로 생성
}

void main() {
 Person person1 = Person('John', 30, Address('123 Main St'));
 Person person2 = person1.deepCopy();

 print(identical(person1, person2));
}