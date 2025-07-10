import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required PhotoType type,
    required DateTime createdAt,
    String? title,
    String? content,
    String? url,
    String? caption,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

enum PhotoType { article, image, video, invalid }
