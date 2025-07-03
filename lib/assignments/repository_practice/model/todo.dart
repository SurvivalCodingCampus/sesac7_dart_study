class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: int.parse(json["userId"]),
      id: int.parse(json["id"]),
      title: json["title"],
      completed: json["completed"].toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "id": id, "title": title, "completed": completed};
  }
}
