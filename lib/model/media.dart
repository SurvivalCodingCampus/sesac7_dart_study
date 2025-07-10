import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/enum/media_type.dart';

part 'media.freezed.dart';

@freezed
class Media with _$Media {
  @override
  final num id;
  @override
  final MediaType type;
  @override
  final String title;
  @override
  final String content;
  @override
  final String url;
  @override
  final String caption;
  @override
  final DateTime createdAt;

  const Media({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.url,
    required this.caption,
    required this.createdAt,
  });
}
