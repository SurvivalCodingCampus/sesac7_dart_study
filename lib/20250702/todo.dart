class Todo {
  final num? userId;
  final num? id;
  final String? title;
  final bool? completed;

  Todo(this.userId, this.id, this.title, this.completed);

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'userId': userId ?? 0,
      'id': id ?? 0,
      'title': title ?? '',
      'completed': completed ?? false,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      map['userId'] as num,
      map['id'] as num,
      map['title'] as String,
      map['completed'] as bool,
    );
  }

  Todo copyWith({
    num? userId,
    num? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      userId ?? this.userId,
      id ?? this.id,
      title ?? this.title,
      completed ?? this.completed,
    );
  }
}
