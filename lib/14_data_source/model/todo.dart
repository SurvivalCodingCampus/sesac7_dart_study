class Todo {
  final num? userId;
  final num? id;
  final String? title;
  final bool? completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: (json['userId'] is num) ? json['userId'] as num : null,
      id: (json['id'] is num) ? json['id'] as num : null,
      title: (json['title'] is String) ? json['title'] as String : null,
      completed: (json['completed'] is bool) ? json['completed'] as bool : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "id": id, "title": title, "completed": completed};
  }

  @override
  bool operator ==(Object other) {
    if (other is Todo) {
      return userId == other.userId &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;
    }
    return false;
  }

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  @override
  String toString() {
    return '{"userId": $userId, "id": $id, "title": $title, "completed": $completed}';
  }
}
