import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  Comment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  String toString() {
    return '$postId, $id, $name, $email, $body';
  }
}
