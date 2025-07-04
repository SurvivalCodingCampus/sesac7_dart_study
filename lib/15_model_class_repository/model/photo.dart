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

  @override
  bool operator ==(Object other) {
    if (other is Photo) {
      return albumId == other.albumId &&
          id == other.id &&
          title == other.title &&
          url == other.url &&
          thumbnailUrl == other.thumbnailUrl;
    }
    return false;
  }

  @override
  int get hashCode =>
      albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;

  @override
  String toString() {
    return '{"albumId": $albumId, "id": $id, "title": "$title", "url": "$url", "thumbnailUrl": "$thumbnailUrl"}';
  }
}
