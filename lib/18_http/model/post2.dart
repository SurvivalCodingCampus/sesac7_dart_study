import 'package:freezed_annotation/freezed_annotation.dart';

part 'post2.freezed.dart';

part 'post2.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Post2 with _$Post2 {
  @override
  final int age;
  @override
  final String name;

  const Post2({
    required this.age,
    required this.name,
  });

  factory Post2.fromJson(Map<String, Object?> json) => _$Post2FromJson(json);

  Map<String, dynamic> toJson() => _$Post2ToJson(this);
}
