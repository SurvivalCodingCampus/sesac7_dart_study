class PhotoDto {
  final dynamic id;
  final String? type;
  final String? title;
  final String? content;
  final String? url;
  final String? caption;

  final String? createdAt;

  PhotoDto({
    required this.id,
    this.type,
    this.title,
    this.content,
    this.url,
    this.caption,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      content: json['content'],
      url: json['url'],
      caption: json['caption'],
      createdAt: json['created_at'],
    );
  }
}
