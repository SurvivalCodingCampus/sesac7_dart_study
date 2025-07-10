// lib/post.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post2.freezed.dart';
part 'post2.g.dart'; // JSON 변환까지 할 거면 필요함

@freezed
abstract class Post2 with _$Post2 {
  const factory Post2({required int id, required String title}) = _Post2;

  factory Post2.fromJson(Map<String, dynamic> json) => _$Post2FromJson(json);
}
