import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  final int userId;
  final int id;
  final String title;

  // 생성자
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  // copyWith
  Album copyWith({
    int? userId,
    int? id,
    String? title,
  }) {
    return Album(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Album &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return '[userId: $userId, id: $id, title: $title]';
  }

  // 역직렬화
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  // 직렬화
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
