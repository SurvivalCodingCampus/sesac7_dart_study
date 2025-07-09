class PhotoDto {
  int? id;
  String? type;
  String? title;
  String? url;
  String? content;
  String? caption;
  String? createdAt;

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.url,
    this.content,
    this.caption,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: (json['id'] == null || int.tryParse(json['id'].toString()) == null)
          ? null
          : int.tryParse(json['id'].toString()),
      type: json['type'] == null ? null : json['type'] as String,
      title: json['title'] == null ? null : json['title'] as String,
      url: json['url'] == null ? null : json['url'] as String,
      content: json['content'] == null ? null : json['content'] as String,
      caption: json['caption'] == null ? null : json['caption'] as String,
      createdAt: json['created_at'] == null
          ? null
          : json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'url': url,
      'content': content,
      'caption': caption,
      'created_at': createdAt,
    };
  }
}
