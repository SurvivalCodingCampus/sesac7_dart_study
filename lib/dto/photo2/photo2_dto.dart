class Photo2Dto {
  dynamic id;
  String? type;
  String? title;
  String? content;
  String? url;
  String? caption;
  String? createdAt;

  Photo2Dto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.url,
    this.caption,
    this.createdAt,
  });

  factory Photo2Dto.fromJson(Map<String, dynamic> json) => Photo2Dto(
    id: json['id'],
    type: json['type'] as String?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    url: json['url'] as String?,
    caption: json['caption'] as String?,
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'title': title,
    'content': content,
    'url': url,
    'caption': caption,
    'created_at': createdAt,
  };
}
