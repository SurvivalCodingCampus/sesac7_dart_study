class PhotoDto {
  int? id;
  String? type;
  String? title;
  String? content;
  String? createdAt;
  String? url;
  String? caption;

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.createdAt,
    this.url,
    this.caption,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'content': content,
      'created_at': createdAt,
      'url': url,
      'caption': caption,
    };
  }

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id'] as int?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      url: json['url'] as String?,
      caption: json['caption'] as String?,
    );
  }

  @override
  String toString() =>
      "PhotoDto(id: $id,type: $type,title: $title,content: $content,createdAt: $createdAt,url: $url,caption: $caption)";

  @override
  int get hashCode =>
      Object.hash(id, type, title, content, createdAt, url, caption);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          title == other.title &&
          content == other.content &&
          createdAt == other.createdAt &&
          url == other.url &&
          caption == other.caption;
}
