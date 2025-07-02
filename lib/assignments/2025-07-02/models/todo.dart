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

  Todo.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      userId = json['userId'],
      title = json['title'],
      completed = json['completed'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }
}
