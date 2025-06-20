class Person{
  final String name;
  final int age;

  Person({required this.name, required this.age});

  // copyWith 메서드 구현
  // primitive타입 String 복사
  Person copyWith({String? name, int? age}){
    return Person(name: name ?? this.name, age: age ?? this.age);
  }
}