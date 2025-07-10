import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart'; //필요
part 'photo.g.dart'; //필요

enum Type { Article, Image, Video, Unknown }

@freezed //필요
@JsonSerializable(explicitToJson: true) //필요
class Photo with _$Photo {
  const Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.url,
    required this.caption,
  });

  @override
  final num id;
  @override
  final Type type;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final String url;
  @override
  final String caption;
}
