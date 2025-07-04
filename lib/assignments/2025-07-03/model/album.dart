// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  @override
  bool operator ==(covariant Album other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.id == id && other.title == title;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  @override
  String toString() => 'Album(userId: $userId, id: $id, title: $title)';

  Album copyWith({int? userId, int? id, String? title}) {
    return Album(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
