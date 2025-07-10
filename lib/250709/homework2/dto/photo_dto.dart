class PhotoDto {
  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.createdAt,
    this.url,
    this.caption,
  });

  PhotoDto.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    url = json['url'];
    caption = json['caption'];
  }

  dynamic id;
  String? type;
  String? title;
  String? content;
  String? createdAt;
  String? url;
  String? caption;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['title'] = title;
    map['content'] = content;
    map['created_at'] = createdAt;
    map['url'] = url;
    map['caption'] = caption;
    return map;
  }
}
