class PhotoDto {
  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.url,
    this.caption,
    this.content,
    required this.createdAt,
  });

  PhotoDto.fromJson(dynamic json) : createdAt = json['created_at'] {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    url = json['url'];
    caption = json['caption'];
    content = json['content'];
  }

  @override
  String toString() {
    return 'PhotoDto{id: $id, type: $type, title: $title, url: $url, caption: $caption, content: $content, createdAt: $createdAt}\n\n';
  }

  Object? id;
  String? type;
  String? title;
  String? url;
  String? caption;
  String? content;
  String createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['title'] = title;
    map['url'] = url;
    map['caption'] = caption;
    map['content'] = content;
    map['created_at'] = createdAt;
    return map;
  }
}
