class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  // String toJsonString() {
  //   return '''"name": "$name", "age": $age''';
  // }

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  @override
  bool operator ==(Object other) {
    if (other is Employee) {
      return name == other.name && age == other.age;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
