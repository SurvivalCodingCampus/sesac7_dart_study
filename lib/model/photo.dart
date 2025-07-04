import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(explicitToJson: true)
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  Photo copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return Photo(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  @override
  int get hashCode => Object.hash(albumId, id, title, url, thumbnailUrl);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Photo &&
            albumId == other.albumId &&
            id == other.id &&
            title == other.title &&
            url == other.url &&
            thumbnailUrl == other.thumbnailUrl;
  }
}
