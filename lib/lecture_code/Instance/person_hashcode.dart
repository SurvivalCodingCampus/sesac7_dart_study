class Person {
  String name;
  int age;

  Person(this.name, this.age);

  // == 연산자 재정의
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person && runtimeType == other.runtimeType && name == other.name && age == other.age;

  // hashCode 재정의 (없다면 이 두 Person 객체는 Set에 둘 다 들어감)
  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

void main() {
  var person1 = Person('Alice', 30);
  var person2 = Person('Alice', 30); // person1과 내용이 같음

  print(person1.hashCode);
  print(person2.hashCode);

  var peopleSet = <Person>{};
  peopleSet.add(person1);
  peopleSet.add(person2); // hashCode와 ==가 재정의되어 있다면, 이 add는 중복으로 간주되어 무시됨


  print(peopleSet.length); // hashCode와 ==가 재정의되면 1, 아니면 2

  final person3 = Person('슈퍼맨', 1);
  final person4 = person3;

  print(identical(person3, person4)); // 실제 객체 주소가 같은지 확인


}