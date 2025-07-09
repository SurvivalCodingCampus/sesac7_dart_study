import 'package:json_annotation/json_annotation.dart';

part 'media_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MediaDto {
  final dynamic id;
  final String? type;
  final String? title;
  final String? content;
  final String? url;
  final String? caption;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const MediaDto({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.url,
    required this.caption,
    required this.createdAt,
  });

  factory MediaDto.fromJson(Map<String, dynamic> json) =>
      _$MediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MediaDtoToJson(this);
}
