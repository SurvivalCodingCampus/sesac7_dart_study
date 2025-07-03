import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  @override
  bool operator ==(Object other) => other is Album
      ? userId == other.userId && id == other.id && title == other.title
      : false;

  @override
  int get hashCode => Object.hash(userId, id, title);

  @override
  String toString() => 'Album(userId: $userId, id: $id, title: $title)';

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
