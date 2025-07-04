import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  Album copyWith(
    int userId,
    int id,
    String title,
  ) {
    return Album(
      userId: this.userId,
      id: this.id,
      title: this.title,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is Album) {
      return userId == other.userId && id == other.id && title == other.title;
    }
    return false;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return '{"userId": $userId, "id": $id, "title": "$title"}';
  }

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
