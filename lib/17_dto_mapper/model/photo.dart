import 'package:freezed_annotation/freezed_annotation.dart';

import '../media_type.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required MediaType type,
    required String url,
    required String caption,
    required String title,
    required String content,
    required DateTime createdAt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
