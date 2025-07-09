import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

enum Type {
  Article,
  Image,
  Video,
  Unknown,
}

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required Type type,
    required String title,
    required String url,
    required String caption,
    required String content,
    required DateTime createdAt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
