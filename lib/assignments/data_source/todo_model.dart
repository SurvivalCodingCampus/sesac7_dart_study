class Todo {
  final num userId;
  final num id;
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
      userId: (json['userId'] as num?) ?? 0,
      id: (json['id'] as num?) ?? 0,
      title: (json['title'] as String?) ?? '',
      completed: (json['completed'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "id": id, "title": title, "completed": completed};
  }
}
