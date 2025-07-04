import 'package:json_annotation/json_annotation.dart';

part 'albums.g.dart';

@JsonSerializable()
class Album {

  final num userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}