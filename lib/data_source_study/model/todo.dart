class Todo {
  int _userId;
  int _id;
  String _title;
  bool _completed;

  static const int idBase = 0; // id 기준값(이것보단 커야한다)
  static const int defaultIdValue = 1; // id의 최소값

  // 생성자
  Todo({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) : _userId = userId > idBase ? userId : defaultIdValue,
       _id = id > idBase ? id : defaultIdValue,
       _title = title.isEmpty ? 'undefined' : title,
       _completed = completed;

  // getter
  int get userId => _userId;

  int get id => _id;

  String get title => _title;

  bool get completed => _completed;

  // setter
  set userId(int userId) {
    if (userId < defaultIdValue) {
      throw Exception('userId는 1 이상의 값으로 설정 가능합니다.');
    }
    _userId = userId;
  }

  set id(int id) {
    if (id < defaultIdValue) {
      throw Exception('id는 1 이상의 값으로 설정 가능합니다.');
    }
    _id = id;
  }

  set title(String title) {
    if (title.isEmpty) {
      throw Exception('title은 비어있는 상태일 수 없습니다.');
    }
    _title = title;
  }

  set completed(bool completed) => _completed = completed;

  // 역직렬화(factory)
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] > idBase ? json['userId'] : defaultIdValue,
      id: json['id'] > idBase ? json['id'] : defaultIdValue,
      title: json['title'].isEmpty ? 'none' : json['title'],
      completed: json['completed'],
    );
  }

  // 역직렬화
  Todo.fromJson2(Map<String, dynamic> json)
    : _userId = json['userId'] > idBase ? json['userId'] : defaultIdValue,
      _id = json['id'] > idBase ? json['id'] : defaultIdValue,
      _title = json['title'].isEmpty ? 'none' : json['title'],
      _completed = json['completed'];

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'userId': userId > idBase ? userId : defaultIdValue,
      'id': id > idBase ? id : defaultIdValue,
      'title': title.isEmpty ? 'none' : title,
      'complete': completed,
    };
  }

  @override
  String toString() {
    return 'userId: $userId, id: $id, title: $title, completed: $completed\n';
  }
}
