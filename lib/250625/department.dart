import 'package:modu_3_dart_study/250625/employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);

  // String toJsonString() {
  //   return '''{"name": "$name", "leader": {${leader.toJsonString()}}}''';
  // }

  @override
  bool operator ==(Object other) {
    if (other is Department) {
      return name == other.name && leader == other.leader;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;
}
