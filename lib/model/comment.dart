import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  @override
  bool operator ==(Object other) => other is Comment
      ? postId == other.postId &&
            id == other.id &&
            name == other.name &&
            email == other.email &&
            body == other.body
      : false;

  @override
  int get hashCode => Object.hash(postId, id, name, email, body);

  @override
  String toString() =>
      'Comment(postId: $postId, id: $id, name: $name, email: $email, body: $body)';

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  Comment copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }
}
