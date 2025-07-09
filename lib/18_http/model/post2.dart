import 'package:freezed_annotation/freezed_annotation.dart';

part 'post2.freezed.dart';

part 'post2.g.dart';

@freezed
@JsonSerializable(explicitToJson: true) // 수동
class Post2 with _$Post2 {
  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final String body;

  const Post2({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post2.fromJson(Map<String, Object?> json) => _$Post2FromJson(json);

  // toJson 수동으로 넣어 줘야 함
  Map<String, dynamic> toJson() => _$Post2ToJson(this);
}
