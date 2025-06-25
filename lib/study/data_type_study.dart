class Student {
  String _name;
  int _midTermScore;
  int _finalScore;

  // 생성자
  Student({
    required String name,
    required int midTermScore,
    required int finalScore,
  }) : _name = name,
       _midTermScore = midTermScore,
       _finalScore = finalScore;

  // getter
  String get name => _name;

  int get midTermScore => _midTermScore;

  int get finalScore => _finalScore;

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'midTermScore': midTermScore,
      'finalScore': finalScore,
    };
  }

  // 역직렬화
  Student.fromJson(Map<String, dynamic> jsonMap)
    : _name = jsonMap['name'],
      _midTermScore = jsonMap['midTermScore'],
      _finalScore = jsonMap['finalScore'];
}
