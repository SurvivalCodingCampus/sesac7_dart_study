class Todo {
  // "userId": 1,
  // "id": 1,
  // "title": "delectus aut autem",
  // "completed": false
  int id;
  int userId;
  String title;
  bool completed;

  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  Todo.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      userId = map['userId'],
      title = map['title'],
      completed = map['completed'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }
}
