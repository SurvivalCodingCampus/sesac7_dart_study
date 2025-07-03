import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(explicitToJson: true)
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  @override
  bool operator ==(Object other) => other is Photo
      ? albumId == other.albumId &&
            id == other.id &&
            title == other.title &&
            url == other.url &&
            thumbnailUrl == other.thumbnailUrl
      : false;

  @override
  int get hashCode => Object.hash(albumId, id, title, url, thumbnailUrl);

  @override
  String toString() =>
      'Photo(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
