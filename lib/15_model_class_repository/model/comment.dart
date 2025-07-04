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

  Comment copyWith(
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  ) {
    return Comment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is Comment) {
      return postId == other.postId &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          body == other.body;
    }
    return false;
  }

  @override
  int get hashCode =>
      postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;

  @override
  String toString() {
    return '{"postId": $postId, "id": $id, "name": "$name", "email": "$email", "body": "$body"}';
  }

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
