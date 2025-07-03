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
      userId: json['userId'] is double
          ? (json['userId'] as double).toInt()
          : json['userId'],
      id: json['id'] is double ? (json['id'] as double).toInt() : json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  @override
  String toString() =>
      'Todo(userId: $userId, id: $id, title: $title, completed: $completed)';

  @override
  int get hashCode => Object.hash(userId, id, title, completed);

  @override
  bool operator ==(Object other) => other is Todo
      ? userId == other.userId &&
            id == other.id &&
            title == other.title &&
            completed == other.completed
      : false;

  Todo copyWith({num? userId, num? id, String? title, bool? completed}) => Todo(
    userId: userId ?? this.userId,
    id: id ?? this.id,
    title: title ?? this.title,
    completed: completed ?? this.completed,
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'completed': completed,
  };
}
