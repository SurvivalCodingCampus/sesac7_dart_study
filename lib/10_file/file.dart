import 'dart:convert';
import 'dart:io';

void main() {
  final file = File('asset/save.txt');
  file.writeAsStringSync('Hello\t', mode: FileMode.append);
  file.writeAsStringSync('Hello\\', mode: FileMode.append);
  file.writeAsStringSync('Hello\n', mode: FileMode.append);

  // print(file.readAsStringSync());

  print(jsonEncode(Employee('홍길동', 10, Department('총무부'))));

  final Map<String, dynamic> json = jsonDecode('''{
  "name": "John Smith",
  "email": "john@example.com"
}
''');

  print(json['name']);
  print(json['email']);
}

class Department {
  String name;

  Department(this.name);

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}

class Employee {
  String name;
  int age;
  Department department;

  Employee(this.name, this.age, this.department);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'department': department,
    };
  }
}
