// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'to_do.g.dart';

@JsonSerializable()
class ToDo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoToJson(this);

  @override
  bool operator ==(covariant ToDo other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }

  @override
  String toString() {
    return 'ToDo(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  ToDo copyWith({int? userId, int? id, String? title, bool? completed}) {
    return ToDo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
