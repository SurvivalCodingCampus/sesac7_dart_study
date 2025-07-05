import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  final num? userId;
  final num? id;
  final String? title;
  final String? body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  Post copyWith({num? userId, num? id, String? title, String? body}) => Post(
    userId: userId ?? this.userId,
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
  );

  @override
  String toString() =>
      'Post(userId: $userId, id: $id, title: $title, body: $body)';

  @override
  int get hashCode => Object.hash(userId, id, title, body);

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      other is Post &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body;
}
