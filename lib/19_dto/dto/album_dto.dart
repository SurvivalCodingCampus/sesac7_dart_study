class AlbumDto {
  AlbumDto({
    this.userId,
    this.id,
    this.title,xw
  });

  AlbumDto.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  num? userId;
  num? id;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
