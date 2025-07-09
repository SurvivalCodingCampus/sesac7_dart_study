// {
// "userId": 1,
// "id": 1,
// "title": "delectus aut autem",
// "completed": false
// }

import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is Post) {
      return userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body;
    }
    return false;
  }

  @override
  //int get hashCode => userId.hashCode^id.hashCode^title.hashCode^completed.hashCode;
  int get hashCode => Object.hash(userId, id, title, body);

  Post copyWith({int? userId, int? id, String? title, String? body}) {
    return Post(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'userId: $userId, id:$id, title: $title, body: $body';
  }
}

//
// Post _$PostFromJson(Map<String, dynamic> json) => Post(
//   userId: (json['userId'] as num).toInt(),
//   id: (json['id'] as num).toInt(),
//   title: json['title'] as String,
//   completed: json['completed'] as bool,
// );
//
// Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
//   'userId': instance.userId,
//   'id': instance.id,
//   'title': instance.title,
//   'completed': instance.completed,
// };
