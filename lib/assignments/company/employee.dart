class Employee {
  final String name;
  final int age;

  Employee({
    required this.name,
    required this.age,
  });

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  Map<String, dynamic> toJson() {
    return {"name": name, "age": age};
  }
}
