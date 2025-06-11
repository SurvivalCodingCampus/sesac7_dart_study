import 'package:modu_3_dart_study/person.dart';

void main() {
  practice2();
}

void practice2() {
  Map<String, int> people = {'홍길동': 20, '한석봉': 25};

  for (var element in people.entries) {
    print('"${element.key}의 나이는 ${element.value}살"');
  }
}
