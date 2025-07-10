class PostDto {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostDto({this.userId, this.id, this.title, this.body});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }

  static PostDto fromJson(dynamic json) {
    return PostDto(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
