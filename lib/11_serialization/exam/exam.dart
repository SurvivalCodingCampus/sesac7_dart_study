class Employee {
  final String name;
  final int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  Employee copyWith({String? name, int? age}) {
    return Employee(
      name ?? this.name,
      age ?? this.age,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => Object.hash(name, age);

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }
}

class Department {
  final String name;
  final Employee leader;

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'leader': leader.toJson(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Department &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          leader == other.leader;

  @override
  int get hashCode => Object.hash(name, leader);

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }

  Department copyWith({
    String? name,
    Employee? leader,
  }) {
    return Department(
      name ?? this.name,
      leader ?? this.leader,
    );
  }
}
