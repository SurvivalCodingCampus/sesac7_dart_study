import 'package:modu_3_dart_study/assignments/2025-06-11/person.dart';

void main() {
  Sol2();
  Sol3();
}

void Sol2() {
  final List<Map<String, dynamic>> list = [
    {'name': '홍길동', 'age': 20},
    {'name': '한석봉', 'age': 25},
  ];

  for (final item in list) {
    print('${item['name']}의 나이는 ${item['age']}살 입니다.');
  }
}

void Sol3() {
  final hong = Person('홍길동', 2005);
  final han = Person('한석봉', 2000);

  final List<Person> list = [];
  list.add(hong);
  list.add(han);

  for (final item in list) {
    print(item.name);
  }
}
