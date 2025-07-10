import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/model/photo2/photo2_type.dart';

part "photo2.freezed.dart";

@freezed
class Photo2 with _$Photo2 {
  static final unknownDate = DateTime(0);

  @override
  final int id;
  @override
  final Photo2Type type;
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

  Photo2({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.url,
    required this.caption,
    required this.createdAt,
  });
}
