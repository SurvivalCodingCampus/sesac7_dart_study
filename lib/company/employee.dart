class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = int.parse(json['age']); // parse안하면 subType관련해서 exception 표출 없는 key를 사용하면 null 때문인듯

  Map<String, dynamic> toJson() => {'name': name, 'age': age};

  String toJsonString() => '''{"name": "$name", "age": "$age"}''';
}
