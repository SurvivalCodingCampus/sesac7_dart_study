import 'package:json_annotation/json_annotation.dart';

part 'model_photo.g.dart';

@JsonEnum() // enum 타입을 직렬화, 역직렬화 가능하게 해준다 toJson, fromJson
enum PhotoType { article, image, video, unknown }
// enum은 문자열로 encode,decode 되며 image -> photoType.image 로 매핑

@JsonSerializable()
class ModelPhoto {
  final int id;
  final PhotoType type;
  final String title;
  final String content;
  final DateTime createdAt;
  final String url;
  final String caption;

  ModelPhoto({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.url,
    required this.caption,
  });

  factory ModelPhoto.fromJson(Map<String, dynamic> json) =>
      _$ModelPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$ModelPhotoToJson(this);
}
