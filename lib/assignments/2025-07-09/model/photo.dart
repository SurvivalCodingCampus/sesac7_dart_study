import 'package:modu_3_dart_study/assignments/2025-07-09/model/photo_type.dart';

class Photo {
  final int id;
  final PhotoType type;
  final DateTime createdAt;

  final String? title;
  final String? url;
  final String? content;
  final String? caption;

  Photo({
    required this.id,
    required this.type,
    required this.createdAt,
    this.title,
    this.url,
    this.content,
    this.caption,
  });

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.createdAt == createdAt &&
        other.title == title &&
        other.url == url &&
        other.content == content &&
        other.caption == caption;
  }

  @override
  int get hashCode {
    return Object.hash(id, type, createdAt, title, url, content, caption);
  }

  @override
  String toString() {
    return 'Photo(id: $id, type: $type, createdAt: $createdAt, title: $title, url: $url, content: $content, caption: $caption)';
  }

  Photo copyWith({
    int? id,
    PhotoType? type,
    DateTime? createdAt,
    String? title,
    String? url,
    String? content,
    String? caption,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      url: url ?? this.url,
      content: content ?? this.content,
      caption: caption ?? this.caption,
    );
  }
}
