import 'dart:convert';

class Student {
  String name;
  int midTermScore;
  int finalScore;

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'midTermScore': midTermScore,
      'finalScore': finalScore,
    };
  }

  Student(this.name, this.midTermScore, this.finalScore);
}

void main() {
  Student s = Student('홍길동', 80, 90);
  Map<String, dynamic> result = s.toJson();
  String a = jsonEncode(result);
  print(a);

  Map<String, dynamic> a2 = jsonDecode(a);
  a2['name'] = 'hello';
  print(a2);
}
