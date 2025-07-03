class Todo {
  final num? userId;
  final num? id;
  final String? title;
  final bool? completed;

  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  Todo copyWith({
    num? userId,
    num? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  int get hashCode => Object.hash(userId, id, title, completed);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Todo &&
            userId == other.userId &&
            id == other.id &&
            title == other.title &&
            completed == other.completed;
  }
}
