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

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

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
  int get hashCode => Object.hash(userId, id, title);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Album &&
            userId == other.userId &&
            id == other.id &&
            title == other.title;
  }
}
